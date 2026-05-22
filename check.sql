\pset pager off
\pset format aligned
\x off

\echo '=== 1. Object overview after fixes ==='
SELECT 'views' AS object_type, count(*) AS object_count
FROM information_schema.views
WHERE table_schema = 'public'
UNION ALL
SELECT 'triggers', count(*)
FROM information_schema.triggers
WHERE trigger_schema = 'public'
UNION ALL
SELECT 'routines', count(*)
FROM information_schema.routines
WHERE routine_schema IN ('public', 'gavrilov')
ORDER BY 1;

\echo ''
\echo '=== 2. Delivery anomaly counts after fixes ==='
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
UNION ALL
SELECT 'order_weight_mismatch', count(*)
FROM (
    SELECT d.id
    FROM deliveries d
    LEFT JOIN cargo_orders co ON co.delivery_id = d.id
    GROUP BY d.id, d.cargo_weight
    HAVING COALESCE(SUM(co.weight_kg), 0) <> d.cargo_weight
) AS mismatches
UNION ALL
SELECT 'trucks_last_maintenance_mismatch', count(*)
FROM (
    SELECT t.id
    FROM trucks t
    JOIN maintenance m ON m.truck_id = t.id
    GROUP BY t.id, t.last_maintenance
    HAVING max(m.maintenance_date) <> t.last_maintenance
) AS maintenance_mismatches
ORDER BY 1;

\echo ''
\echo '=== 3. Foreign keys without supporting indexes after fixes ==='
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
\echo '=== 4. Reporting view sample ==='
SELECT
    delivery_id,
    status,
    driver_name,
    plate_number,
    start_city,
    end_city,
    orders_count,
    total_order_weight,
    cargo_weight,
    total_fuel_liters,
    km_per_liter,
    cargo_weight_matches_orders
FROM v_delivery_summary
ORDER BY delivery_id
LIMIT 5;

\echo ''
\echo '=== 5. Function smoke tests ==='
SET search_path = gavrilov, public;
SELECT
    fuel_efficiency(100, 25) AS efficiency_normal_case,
    fuel_efficiency(100, 0) AS efficiency_zero_fuel_returns_null;

\echo ''
\echo '=== 6. Procedure smoke test in rollback-only transaction ==='
BEGIN;
CALL assign_delivery(1, 15, 10, CURRENT_TIMESTAMP::timestamp);
SELECT
    id,
    driver_id,
    truck_id,
    route_id,
    cargo_weight,
    status,
    end_date IS NULL AS end_date_is_null
FROM deliveries
ORDER BY id DESC
LIMIT 1;
ROLLBACK;
