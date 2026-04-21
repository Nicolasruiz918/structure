-- Rollback for 010_create_boarding_tables.sql

DROP INDEX IF EXISTS abordaje.abordaje.idx_boarding_validation_boarding_pass_id CASCADE;
DROP INDEX IF EXISTS abordaje.abordaje.idx_boarding_pass_check_in_id CASCADE;
DROP INDEX IF EXISTS abordaje.abordaje.idx_check_in_status_id CASCADE;

DROP TABLE IF EXISTS abordaje.abordaje.boarding_validation CASCADE;
DROP TABLE IF EXISTS abordaje.abordaje.boarding_pass CASCADE;
DROP TABLE IF EXISTS abordaje.abordaje.check_in CASCADE;
DROP TABLE IF EXISTS abordaje.abordaje.check_in_status CASCADE;
DROP TABLE IF EXISTS abordaje.abordaje.boarding_group CASCADE;


