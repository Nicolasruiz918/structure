-- Rollback for 007_create_aircraft_tables.sql

DROP INDEX IF EXISTS aeronaves.aeronaves.idx_maintenance_event_aircraft_id CASCADE;
DROP INDEX IF EXISTS aeronaves.aeronaves.idx_aircraft_seat_cabin_id CASCADE;
DROP INDEX IF EXISTS aeronaves.aeronaves.idx_aircraft_cabin_aircraft_id CASCADE;
DROP INDEX IF EXISTS aeronaves.aeronaves.idx_aircraft_model_id CASCADE;
DROP INDEX IF EXISTS aeronaves.aeronaves.idx_aircraft_airline_id CASCADE;

DROP TABLE IF EXISTS aeronaves.aeronaves.maintenance_event CASCADE;
DROP TABLE IF EXISTS aeronaves.aeronaves.maintenance_type CASCADE;
DROP TABLE IF EXISTS aeronaves.aeronaves.maintenance_provider CASCADE;
DROP TABLE IF EXISTS aeronaves.aeronaves.aircraft_seat CASCADE;
DROP TABLE IF EXISTS aeronaves.aeronaves.aircraft_cabin CASCADE;
DROP TABLE IF EXISTS aeronaves.aeronaves.aircraft CASCADE;
DROP TABLE IF EXISTS aeronaves.aeronaves.cabin_class CASCADE;
DROP TABLE IF EXISTS aeronaves.aeronaves.aircraft_model CASCADE;
DROP TABLE IF EXISTS aeronaves.aeronaves.aircraft_manufacturer CASCADE;


