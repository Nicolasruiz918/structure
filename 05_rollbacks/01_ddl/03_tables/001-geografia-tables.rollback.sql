-- Rollback for 001_create_geografia_tables.sql

DROP INDEX IF EXISTS geografia.geografia.idx_address_district_id CASCADE;
DROP INDEX IF EXISTS geografia.geografia.idx_district_city_id CASCADE;
DROP INDEX IF EXISTS geografia.geografia.idx_city_state_id CASCADE;
DROP INDEX IF EXISTS geografia.geografia.idx_state_country_id CASCADE;
DROP INDEX IF EXISTS geografia.geografia.idx_country_continent_id CASCADE;

DROP TABLE IF EXISTS geografia.geografia.address CASCADE;
DROP TABLE IF EXISTS geografia.geografia.district CASCADE;
DROP TABLE IF EXISTS geografia.geografia.city CASCADE;
DROP TABLE IF EXISTS geografia.geografia.state_province CASCADE;
DROP TABLE IF EXISTS geografia.geografia.country CASCADE;
DROP TABLE IF EXISTS geografia.geografia.continent CASCADE;
DROP TABLE IF EXISTS geografia.geografia.time_zone CASCADE;
DROP TABLE IF EXISTS geografia.geografia.currency CASCADE;


