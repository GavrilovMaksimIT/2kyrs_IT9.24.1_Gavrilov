BEGIN;

-- 1. Normalize delivery dates so status and timeline no longer conflict.
UPDATE deliveries
SET end_date = NULL
WHERE status = 'planned';

WITH delivery_targets AS (
    SELECT
        d.id,
        GREATEST(
            d.start_date
            + make_interval(
                secs => GREATEST(
                    3600,
                    CEIL(COALESCE(r.estimated_hours, 1) * 3600)::int
                )
            ),
            COALESCE(
                (
                    SELECT max(f.refuel_date + interval '2 hours')
                    FROM fuel_logs f
                    WHERE f.delivery_id = d.id
                ),
                d.start_date + interval '1 hour'
            )
        ) AS corrected_end_date
    FROM deliveries d
    LEFT JOIN routes r ON r.id = d.route_id
    WHERE d.status = 'completed'
      AND (d.end_date IS NULL OR d.end_date < d.start_date)
)
UPDATE deliveries d
SET end_date = t.corrected_end_date
FROM delivery_targets t
WHERE d.id = t.id;

-- 2. Move hire dates back for drivers whose delivery starts before employment.
WITH driver_fix AS (
    SELECT
        dr.id,
        (min(d.start_date)::date - interval '30 days')::date AS corrected_hire_date
    FROM drivers dr
    JOIN deliveries d ON d.driver_id = dr.id
    GROUP BY dr.id, dr.hire_date
    HAVING min(d.start_date)::date < dr.hire_date
)
UPDATE drivers dr
SET hire_date = f.corrected_hire_date
FROM driver_fix f
WHERE dr.id = f.id;

-- 3. Reassign overloaded deliveries to the smallest truck that can carry the load.
WITH overloaded AS (
    SELECT
        d.id,
        candidate.id AS new_truck_id
    FROM deliveries d
    JOIN trucks current_truck ON current_truck.id = d.truck_id
    CROSS JOIN LATERAL (
        SELECT t.id
        FROM trucks t
        WHERE t.capacity_kg >= d.cargo_weight
        ORDER BY t.capacity_kg, t.id
        LIMIT 1
    ) AS candidate
    WHERE d.cargo_weight > current_truck.capacity_kg
)
UPDATE deliveries d
SET truck_id = o.new_truck_id
FROM overloaded o
WHERE d.id = o.id;

-- 4. Redistribute the 100 cargo orders across all deliveries and make weights consistent.
WITH numbered_orders AS (
    SELECT id AS order_id, row_number() OVER (ORDER BY id) AS order_rn
    FROM cargo_orders
),
numbered_deliveries AS (
    SELECT
        id AS delivery_id,
        status AS delivery_status,
        cargo_weight,
        row_number() OVER (ORDER BY id) AS delivery_rn,
        count(*) OVER () AS total_deliveries
    FROM deliveries
),
order_totals AS (
    SELECT count(*) AS total_orders
    FROM cargo_orders
),
delivery_plan AS (
    SELECT
        d.delivery_id,
        d.delivery_status,
        d.cargo_weight,
        d.delivery_rn,
        (o.total_orders / d.total_deliveries)
        + CASE
            WHEN d.delivery_rn <= mod(o.total_orders, d.total_deliveries) THEN 1
            ELSE 0
          END AS orders_count
    FROM numbered_deliveries d
    CROSS JOIN order_totals o
),
delivery_ranges AS (
    SELECT
        delivery_id,
        delivery_status,
        cargo_weight,
        orders_count,
        delivery_rn,
        COALESCE(
            sum(orders_count) OVER (
                ORDER BY delivery_rn
                ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING
            ),
            0
        ) + 1 AS start_order_rn,
        sum(orders_count) OVER (ORDER BY delivery_rn) AS end_order_rn
    FROM delivery_plan
),
assignments AS (
    SELECT
        o.order_id,
        r.delivery_id,
        r.delivery_status,
        r.cargo_weight,
        r.orders_count,
        row_number() OVER (PARTITION BY r.delivery_id ORDER BY o.order_rn) AS order_pos
    FROM delivery_ranges r
    JOIN numbered_orders o
      ON o.order_rn BETWEEN r.start_order_rn AND r.end_order_rn
)
UPDATE cargo_orders co
SET delivery_id = a.delivery_id,
    weight_kg = (a.cargo_weight / a.orders_count)
        + CASE
            WHEN a.order_pos <= mod(a.cargo_weight, a.orders_count) THEN 1
            ELSE 0
          END,
    status = CASE
        WHEN a.delivery_status = 'completed' THEN 'completed'
        ELSE 'pending'
    END
FROM assignments a
WHERE co.id = a.order_id;

-- 5. Backfill truck maintenance dates from the maintenance log.
UPDATE trucks t
SET last_maintenance = m.max_maintenance_date
FROM (
    SELECT truck_id, max(maintenance_date) AS max_maintenance_date
    FROM maintenance
    GROUP BY truck_id
) m
WHERE t.id = m.truck_id;

-- 6. Tighten NULLability on business-critical columns.
ALTER TABLE drivers
    ALTER COLUMN license_number SET NOT NULL,
    ALTER COLUMN hire_date SET NOT NULL,
    ALTER COLUMN salary SET NOT NULL,
    ALTER COLUMN status SET NOT NULL;

ALTER TABLE trucks
    ALTER COLUMN model SET NOT NULL,
    ALTER COLUMN fuel_type SET NOT NULL;

ALTER TABLE routes
    ALTER COLUMN estimated_hours SET NOT NULL;

ALTER TABLE deliveries
    ALTER COLUMN driver_id SET NOT NULL,
    ALTER COLUMN truck_id SET NOT NULL,
    ALTER COLUMN route_id SET NOT NULL,
    ALTER COLUMN status SET NOT NULL;

ALTER TABLE cargo_orders
    ALTER COLUMN customer_id SET NOT NULL,
    ALTER COLUMN delivery_id SET NOT NULL,
    ALTER COLUMN cargo_type SET NOT NULL,
    ALTER COLUMN weight_kg SET NOT NULL,
    ALTER COLUMN declared_value SET NOT NULL,
    ALTER COLUMN status SET NOT NULL;

ALTER TABLE fuel_logs
    ALTER COLUMN delivery_id SET NOT NULL,
    ALTER COLUMN cost SET NOT NULL,
    ALTER COLUMN refuel_date SET NOT NULL,
    ALTER COLUMN station_name SET NOT NULL;

ALTER TABLE maintenance
    ALTER COLUMN truck_id SET NOT NULL,
    ALTER COLUMN type SET NOT NULL,
    ALTER COLUMN cost SET NOT NULL,
    ALTER COLUMN next_due_date SET NOT NULL;

ALTER TABLE driver_certifications
    ALTER COLUMN driver_id SET NOT NULL,
    ALTER COLUMN certification_name SET NOT NULL,
    ALTER COLUMN issue_date SET NOT NULL,
    ALTER COLUMN expiry_date SET NOT NULL;

-- 7. Replace weak or missing business checks with explicit constraints.
ALTER TABLE drivers
    DROP CONSTRAINT IF EXISTS drivers_status_check,
    DROP CONSTRAINT IF EXISTS drivers_salary_positive_check;
ALTER TABLE drivers
    ADD CONSTRAINT drivers_status_check
        CHECK (status IN ('active', 'inactive', 'on_leave')),
    ADD CONSTRAINT drivers_salary_positive_check
        CHECK (salary > 0);

ALTER TABLE trucks
    DROP CONSTRAINT IF EXISTS trucks_capacity_positive_check,
    DROP CONSTRAINT IF EXISTS trucks_fuel_type_check;
ALTER TABLE trucks
    ADD CONSTRAINT trucks_capacity_positive_check
        CHECK (capacity_kg > 0),
    ADD CONSTRAINT trucks_fuel_type_check
        CHECK (
            fuel_type IN (
                U&'\0431\0435\043D\0437\0438\043D',
                U&'\0434\0438\0437\0435\043B\044C',
                U&'\0433\0430\0437',
                U&'\044D\043B\0435\043A\0442\0440\043E'
            )
        );

ALTER TABLE routes
    DROP CONSTRAINT IF EXISTS routes_distance_positive_check,
    DROP CONSTRAINT IF EXISTS routes_hours_positive_check,
    DROP CONSTRAINT IF EXISTS routes_city_pair_check;
ALTER TABLE routes
    ADD CONSTRAINT routes_distance_positive_check
        CHECK (distance_km > 0),
    ADD CONSTRAINT routes_hours_positive_check
        CHECK (estimated_hours > 0),
    ADD CONSTRAINT routes_city_pair_check
        CHECK (start_city <> end_city);

ALTER TABLE deliveries
    DROP CONSTRAINT IF EXISTS deliveries_cargo_weight_nonnegative_check,
    DROP CONSTRAINT IF EXISTS deliveries_status_check,
    DROP CONSTRAINT IF EXISTS deliveries_end_after_start_check,
    DROP CONSTRAINT IF EXISTS deliveries_completed_requires_end_date_check,
    DROP CONSTRAINT IF EXISTS deliveries_planned_without_end_date_check;
ALTER TABLE deliveries
    ADD CONSTRAINT deliveries_cargo_weight_nonnegative_check
        CHECK (cargo_weight >= 0),
    ADD CONSTRAINT deliveries_status_check
        CHECK (status IN ('planned', 'completed', 'cancelled')),
    ADD CONSTRAINT deliveries_end_after_start_check
        CHECK (end_date IS NULL OR end_date >= start_date),
    ADD CONSTRAINT deliveries_completed_requires_end_date_check
        CHECK (status <> 'completed' OR end_date IS NOT NULL),
    ADD CONSTRAINT deliveries_planned_without_end_date_check
        CHECK (status <> 'planned' OR end_date IS NULL);

ALTER TABLE cargo_orders
    DROP CONSTRAINT IF EXISTS cargo_orders_weight_positive_check,
    DROP CONSTRAINT IF EXISTS cargo_orders_declared_value_nonnegative_check,
    DROP CONSTRAINT IF EXISTS cargo_orders_status_check;
ALTER TABLE cargo_orders
    ADD CONSTRAINT cargo_orders_weight_positive_check
        CHECK (weight_kg > 0),
    ADD CONSTRAINT cargo_orders_declared_value_nonnegative_check
        CHECK (declared_value >= 0),
    ADD CONSTRAINT cargo_orders_status_check
        CHECK (status IN ('pending', 'completed', 'cancelled'));

ALTER TABLE fuel_logs
    DROP CONSTRAINT IF EXISTS fuel_logs_liters_positive_check,
    DROP CONSTRAINT IF EXISTS fuel_logs_cost_nonnegative_check;
ALTER TABLE fuel_logs
    ADD CONSTRAINT fuel_logs_liters_positive_check
        CHECK (fuel_liters > 0),
    ADD CONSTRAINT fuel_logs_cost_nonnegative_check
        CHECK (cost >= 0);

ALTER TABLE maintenance
    DROP CONSTRAINT IF EXISTS maintenance_type_check,
    DROP CONSTRAINT IF EXISTS maintenance_cost_nonnegative_check,
    DROP CONSTRAINT IF EXISTS maintenance_next_due_after_maintenance_check;
ALTER TABLE maintenance
    ADD CONSTRAINT maintenance_type_check
        CHECK (
            type IN (
                U&'\043F\043B\0430\043D\043E\0432\043E\0435',
                U&'\0432\043D\0435\043F\043B\0430\043D\043E\0432\043E\0435'
            )
        ),
    ADD CONSTRAINT maintenance_cost_nonnegative_check
        CHECK (cost >= 0),
    ADD CONSTRAINT maintenance_next_due_after_maintenance_check
        CHECK (next_due_date > maintenance_date);

ALTER TABLE driver_certifications
    DROP CONSTRAINT IF EXISTS driver_certifications_dates_check;
ALTER TABLE driver_certifications
    ADD CONSTRAINT driver_certifications_dates_check
        CHECK (expiry_date > issue_date);

-- 8. Add missing performance indexes on foreign keys and common report filters.
CREATE INDEX IF NOT EXISTS idx_deliveries_driver_id_status
    ON deliveries (driver_id, status);
CREATE INDEX IF NOT EXISTS idx_deliveries_truck_id
    ON deliveries (truck_id);
CREATE INDEX IF NOT EXISTS idx_deliveries_route_id
    ON deliveries (route_id);
CREATE INDEX IF NOT EXISTS idx_cargo_orders_delivery_id_status
    ON cargo_orders (delivery_id, status);
CREATE INDEX IF NOT EXISTS idx_cargo_orders_customer_id
    ON cargo_orders (customer_id);
CREATE INDEX IF NOT EXISTS idx_fuel_logs_delivery_id_refuel_date
    ON fuel_logs (delivery_id, refuel_date);
CREATE INDEX IF NOT EXISTS idx_maintenance_truck_id_maintenance_date
    ON maintenance (truck_id, maintenance_date DESC);
CREATE INDEX IF NOT EXISTS idx_driver_certifications_driver_id
    ON driver_certifications (driver_id);
CREATE INDEX IF NOT EXISTS idx_accidents_delivery_id
    ON accidents (delivery_id);

-- 9. Restore automatic synchronization of derived business data.
CREATE OR REPLACE FUNCTION public.sync_delivery_cargo_weight()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
    IF TG_OP IN ('INSERT', 'UPDATE') THEN
        UPDATE deliveries d
        SET cargo_weight = s.total_weight
        FROM (
            SELECT
                NEW.delivery_id AS delivery_id,
                COALESCE(SUM(weight_kg), 0) AS total_weight
            FROM cargo_orders
            WHERE delivery_id = NEW.delivery_id
        ) s
        WHERE d.id = s.delivery_id;
    END IF;

    IF TG_OP IN ('DELETE', 'UPDATE')
       AND (TG_OP = 'DELETE' OR OLD.delivery_id <> NEW.delivery_id) THEN
        UPDATE deliveries d
        SET cargo_weight = s.total_weight
        FROM (
            SELECT
                OLD.delivery_id AS delivery_id,
                COALESCE(SUM(weight_kg), 0) AS total_weight
            FROM cargo_orders
            WHERE delivery_id = OLD.delivery_id
        ) s
        WHERE d.id = s.delivery_id;
    END IF;

    RETURN NULL;
END;
$$;

DROP TRIGGER IF EXISTS trg_sync_delivery_cargo_weight ON cargo_orders;
CREATE TRIGGER trg_sync_delivery_cargo_weight
AFTER INSERT OR UPDATE OR DELETE ON cargo_orders
FOR EACH ROW
EXECUTE FUNCTION public.sync_delivery_cargo_weight();

CREATE OR REPLACE FUNCTION public.sync_truck_last_maintenance()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
    IF TG_OP IN ('INSERT', 'UPDATE') THEN
        UPDATE trucks t
        SET last_maintenance = (
            SELECT max(m.maintenance_date)
            FROM maintenance m
            WHERE m.truck_id = NEW.truck_id
        )
        WHERE t.id = NEW.truck_id;
    END IF;

    IF TG_OP IN ('DELETE', 'UPDATE')
       AND (TG_OP = 'DELETE' OR OLD.truck_id <> NEW.truck_id) THEN
        UPDATE trucks t
        SET last_maintenance = (
            SELECT max(m.maintenance_date)
            FROM maintenance m
            WHERE m.truck_id = OLD.truck_id
        )
        WHERE t.id = OLD.truck_id;
    END IF;

    RETURN NULL;
END;
$$;

DROP TRIGGER IF EXISTS trg_sync_truck_last_maintenance ON maintenance;
CREATE TRIGGER trg_sync_truck_last_maintenance
AFTER INSERT OR UPDATE OR DELETE ON maintenance
FOR EACH ROW
EXECUTE FUNCTION public.sync_truck_last_maintenance();

-- 10. Fix the broken procedure and function.
CREATE SCHEMA IF NOT EXISTS gavrilov;

CREATE OR REPLACE PROCEDURE gavrilov.assign_delivery(
    IN p_driver_id integer,
    IN p_truck_id integer,
    IN p_route_id integer,
    IN p_start_date timestamp without time zone
)
LANGUAGE plpgsql
AS $procedure$
DECLARE
    v_driver_hire_date date;
BEGIN
    SELECT hire_date
    INTO v_driver_hire_date
    FROM drivers
    WHERE id = p_driver_id
      AND status = 'active';

    IF v_driver_hire_date IS NULL THEN
        RAISE EXCEPTION 'Driver % does not exist or is not active', p_driver_id;
    END IF;

    IF NOT EXISTS (
        SELECT 1
        FROM trucks
        WHERE id = p_truck_id
    ) THEN
        RAISE EXCEPTION 'Truck % does not exist', p_truck_id;
    END IF;

    IF NOT EXISTS (
        SELECT 1
        FROM routes
        WHERE id = p_route_id
    ) THEN
        RAISE EXCEPTION 'Route % does not exist', p_route_id;
    END IF;

    IF p_start_date::date < v_driver_hire_date THEN
        RAISE EXCEPTION 'Delivery start date % is earlier than driver hire date %', p_start_date::date, v_driver_hire_date;
    END IF;

    INSERT INTO deliveries (driver_id, truck_id, route_id, start_date, end_date, cargo_weight, status)
    VALUES (p_driver_id, p_truck_id, p_route_id, p_start_date, NULL, 0, 'planned');
END;
$procedure$;

CREATE OR REPLACE FUNCTION gavrilov.fuel_efficiency(distance_km integer, fuel_liters numeric)
RETURNS numeric
LANGUAGE plpgsql
AS $function$
BEGIN
    IF distance_km IS NULL OR distance_km <= 0 OR fuel_liters IS NULL OR fuel_liters <= 0 THEN
        RETURN NULL;
    END IF;

    RETURN round(distance_km::numeric / fuel_liters, 2);
END;
$function$;

-- 11. Recreate a reporting view with correct joins and aggregates.
CREATE OR REPLACE VIEW public.v_delivery_summary AS
WITH order_stats AS (
    SELECT
        delivery_id,
        count(*) AS orders_count,
        sum(weight_kg) AS total_order_weight,
        sum(declared_value) AS total_declared_value
    FROM cargo_orders
    GROUP BY delivery_id
),
fuel_stats AS (
    SELECT
        delivery_id,
        sum(fuel_liters) AS total_fuel_liters,
        sum(cost) AS total_fuel_cost
    FROM fuel_logs
    GROUP BY delivery_id
)
SELECT
    d.id AS delivery_id,
    d.status,
    d.start_date,
    d.end_date,
    dr.full_name AS driver_name,
    t.plate_number,
    t.model AS truck_model,
    t.capacity_kg,
    r.start_city,
    r.end_city,
    r.distance_km,
    r.estimated_hours,
    COALESCE(os.orders_count, 0) AS orders_count,
    COALESCE(os.total_order_weight, 0) AS total_order_weight,
    d.cargo_weight,
    COALESCE(os.total_declared_value, 0)::numeric(14, 2) AS total_declared_value,
    COALESCE(fs.total_fuel_liters, 0)::numeric(12, 2) AS total_fuel_liters,
    COALESCE(fs.total_fuel_cost, 0)::numeric(14, 2) AS total_fuel_cost,
    gavrilov.fuel_efficiency(r.distance_km, fs.total_fuel_liters) AS km_per_liter,
    (COALESCE(os.total_order_weight, 0) = d.cargo_weight) AS cargo_weight_matches_orders
FROM deliveries d
JOIN drivers dr ON dr.id = d.driver_id
JOIN trucks t ON t.id = d.truck_id
JOIN routes r ON r.id = d.route_id
LEFT JOIN order_stats os ON os.delivery_id = d.id
LEFT JOIN fuel_stats fs ON fs.delivery_id = d.id;

COMMIT;
