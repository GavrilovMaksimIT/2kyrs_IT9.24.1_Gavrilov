\pset pager off
\pset format aligned
\x off

\echo '=== 1. Object overview ==='
SELECT 'tables' AS object_type, count(*) AS object_count
FROM information_schema.tables
WHERE table_schema = 'public'
UNION ALL
SELECT 'views', count(*)
FROM information_schema.views
WHERE table_schema = 'public'
UNION ALL
SELECT 'triggers', count(*)
FROM information_schema.triggers
WHERE trigger_schema = 'public'
UNION ALL
SELECT 'routines', count(*)
FROM information_schema.routines
WHERE routine_schema = 'public'
ORDER BY 1;

\echo ''
\echo '=== 2. Missing index support for foreign keys ==='
WITH fk_columns AS (
    SELECT
        con.conrelid::regclass::text AS table_name,
        con.conname AS constraint_name,
        array_agg(att.attname ORDER BY ord.n) AS fk_columns
    FROM pg_constraint con
    JOIN LATERAL unnest(con.conkey) WITH ORDINALITY AS ord(attnum, n) ON true
    JOIN pg_attribute att
      ON att.attrelid = con.conrelid
     AND att.attnum = ord.attnum
    WHERE con.contype = 'f'
      AND con.connamespace = 'public'::regnamespace
    GROUP BY con.conrelid, con.conname
),
indexed_prefixes AS (
    SELECT
        idx.indrelid::regclass::text AS table_name,
        array_agg(att.attname ORDER BY ord.n) AS indexed_columns
    FROM pg_index idx
    JOIN LATERAL unnest(idx.indkey) WITH ORDINALITY AS ord(attnum, n) ON ord.attnum > 0
    JOIN pg_attribute att
      ON att.attrelid = idx.indrelid
     AND att.attnum = ord.attnum
    WHERE idx.indrelid IN (
        SELECT conrelid
        FROM pg_constraint
        WHERE contype = 'f'
          AND connamespace = 'public'::regnamespace
    )
    GROUP BY idx.indexrelid, idx.indrelid
)
SELECT
    fk.table_name,
    fk.constraint_name,
    array_to_string(fk.fk_columns, ', ') AS fk_columns
FROM fk_columns fk
WHERE NOT EXISTS (
    SELECT 1
    FROM indexed_prefixes ip
    WHERE ip.table_name = fk.table_name
      AND ip.indexed_columns[1:cardinality(fk.fk_columns)] = fk.fk_columns
)
ORDER BY fk.table_name, fk.constraint_name;

\echo ''
\echo '=== 3. Delivery data anomalies ==='
SELECT 'deliveries_end_before_start' AS check_name, count(*) AS issue_count
FROM deliveries
WHERE end_date IS NOT NULL
  AND end_date < start_date
UNION ALL
SELECT 'deliveries_planned_with_end_date', count(*)
FROM deliveries
WHERE status = 'planned'
  AND end_date IS NOT NULL
UNION ALL
SELECT 'deliveries_completed_without_end_date', count(*)
FROM deliveries
WHERE status = 'completed'
  AND end_date IS NULL
UNION ALL
SELECT 'deliveries_before_driver_hire', count(*)
FROM deliveries d
JOIN drivers dr ON dr.id = d.driver_id
WHERE d.start_date::date < dr.hire_date
UNION ALL
SELECT 'deliveries_over_capacity', count(*)
FROM deliveries d
JOIN trucks t ON t.id = d.truck_id
WHERE d.cargo_weight > t.capacity_kg
UNION ALL
SELECT 'fuel_logs_outside_delivery_window', count(*)
FROM fuel_logs f
JOIN deliveries d ON d.id = f.delivery_id
WHERE f.refuel_date < d.start_date
   OR (d.end_date IS NOT NULL AND f.refuel_date > d.end_date)
ORDER BY 1;

\echo ''
\echo '=== 4. Rows with inconsistent deliveries ==='
\x on
SELECT
    d.id,
    d.driver_id,
    dr.hire_date,
    d.truck_id,
    t.capacity_kg,
    d.route_id,
    d.start_date,
    d.end_date,
    d.cargo_weight,
    d.status
FROM deliveries d
JOIN drivers dr ON dr.id = d.driver_id
JOIN trucks t ON t.id = d.truck_id
WHERE (d.end_date IS NOT NULL AND d.end_date < d.start_date)
   OR (d.status = 'planned' AND d.end_date IS NOT NULL)
   OR (d.status = 'completed' AND d.end_date IS NULL)
   OR d.start_date::date < dr.hire_date
   OR d.cargo_weight > t.capacity_kg
ORDER BY d.id;
\x off

\echo ''
\echo '=== 5. Cargo weight mismatch between deliveries and orders ==='
\x on
SELECT
    d.id,
    d.cargo_weight AS delivery_weight,
    COALESCE(SUM(co.weight_kg), 0) AS orders_weight,
    count(co.*) AS orders_count
FROM deliveries d
LEFT JOIN cargo_orders co ON co.delivery_id = d.id
GROUP BY d.id, d.cargo_weight
HAVING COALESCE(SUM(co.weight_kg), 0) <> d.cargo_weight
ORDER BY d.id;
\x off

\echo ''
\echo '=== 6. Trucks with stale last_maintenance ==='
\x on
SELECT
    t.id,
    t.last_maintenance,
    max(m.maintenance_date) AS expected_last_maintenance
FROM trucks t
JOIN maintenance m ON m.truck_id = t.id
GROUP BY t.id, t.last_maintenance
HAVING max(m.maintenance_date) <> t.last_maintenance
ORDER BY t.id;
\x off

\echo ''
\echo '=== 7. Function and procedure definitions ==='
SELECT p.proname, pg_get_functiondef(p.oid)
FROM pg_proc p
JOIN pg_namespace n ON n.oid = p.pronamespace
WHERE n.nspname = 'public'
ORDER BY p.proname;
