-- Rollback for 006_create_airport_tables.sql

DROP INDEX IF EXISTS aeropuerto.aeropuerto.idx_runway_airport_id CASCADE;
DROP INDEX IF EXISTS aeropuerto.aeropuerto.idx_boarding_gate_terminal_id CASCADE;
DROP INDEX IF EXISTS aeropuerto.aeropuerto.idx_terminal_airport_id CASCADE;
DROP INDEX IF EXISTS aeropuerto.aeropuerto.idx_airport_address_id CASCADE;

DROP TABLE IF EXISTS aeropuerto.aeropuerto.airport_regulation CASCADE;
DROP TABLE IF EXISTS aeropuerto.aeropuerto.runway CASCADE;
DROP TABLE IF EXISTS aeropuerto.aeropuerto.boarding_gate CASCADE;
DROP TABLE IF EXISTS aeropuerto.aeropuerto.terminal CASCADE;
DROP TABLE IF EXISTS aeropuerto.aeropuerto.airport CASCADE;


