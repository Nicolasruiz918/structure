-- ============================================
-- GEOGRAFIA - Rollback Índices
-- ============================================

DROP INDEX IF EXISTS geografia.idx_continent_code;
DROP INDEX IF EXISTS geografia.idx_continent_name;
DROP INDEX IF EXISTS geografia.idx_country_continent_id;
DROP INDEX IF EXISTS geografia.idx_country_alpha2;
DROP INDEX IF EXISTS geografia.idx_country_alpha3;
DROP INDEX IF EXISTS geografia.idx_state_country_id;
DROP INDEX IF EXISTS geografia.idx_city_state_id;
DROP INDEX IF EXISTS geografia.idx_city_time_zone_id;
DROP INDEX IF EXISTS geografia.idx_district_city_id;
DROP INDEX IF EXISTS geografia.idx_address_district_id;
