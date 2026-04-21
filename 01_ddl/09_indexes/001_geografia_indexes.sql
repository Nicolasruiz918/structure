-- ============================================
-- GEOGRAFIA - Índices
-- ============================================

CREATE INDEX idx_continent_code ON geografia.continent(continent_code);
CREATE INDEX idx_continent_name ON geografia.continent(continent_name);
CREATE INDEX idx_country_continent_id ON geografia.country(continent_id);
CREATE INDEX idx_country_alpha2 ON geografia.country(iso_alpha2);
CREATE INDEX idx_country_alpha3 ON geografia.country(iso_alpha3);
CREATE INDEX idx_state_country_id ON geografia.state_province(country_id);
CREATE INDEX idx_city_state_id ON geografia.city(state_province_id);
CREATE INDEX idx_city_time_zone_id ON geografia.city(time_zone_id);
CREATE INDEX idx_district_city_id ON geografia.district(city_id);
CREATE INDEX idx_address_district_id ON geografia.address(district_id);
