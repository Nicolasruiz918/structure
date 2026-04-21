-- Rollback for 008_create_flight_operations_tables.sql

DROP INDEX IF EXISTS operaciones.operaciones.idx_flight_delay_segment_id CASCADE;
DROP INDEX IF EXISTS operaciones.operaciones.idx_flight_segment_destination_airport_id CASCADE;
DROP INDEX IF EXISTS operaciones.operaciones.idx_flight_segment_origin_airport_id CASCADE;
DROP INDEX IF EXISTS operaciones.operaciones.idx_flight_segment_flight_id CASCADE;
DROP INDEX IF EXISTS operaciones.operaciones.idx_flight_service_date CASCADE;
DROP INDEX IF EXISTS operaciones.operaciones.idx_flight_aircraft_id CASCADE;

DROP TABLE IF EXISTS operaciones.operaciones.flight_delay CASCADE;
DROP TABLE IF EXISTS operaciones.operaciones.flight_segment CASCADE;
DROP TABLE IF EXISTS operaciones.operaciones.flight CASCADE;
DROP TABLE IF EXISTS operaciones.operaciones.delay_reason_type CASCADE;
DROP TABLE IF EXISTS operaciones.operaciones.flight_status CASCADE;


