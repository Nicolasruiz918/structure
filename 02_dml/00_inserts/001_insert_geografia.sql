-- Insert de datos de prueba para el dominio GEOGRAFÍA
-- Basado en docs/plan_datos_prueba.md

-- time_zone
INSERT INTO geografia.time_zone (time_zone_name, utc_offset_minutes) VALUES
  ('America/Bogota', -300),
  ('America/Mexico_City', -360),
  ('America/New_York', -300),
  ('Europe/Madrid', 60),
  ('Asia/Tokyo', 540);

-- continent
INSERT INTO geografia.continent (continent_code, continent_name) VALUES
  ('NA', 'North America'),
  ('SA', 'South America'),
  ('EU', 'Europe'),
  ('AS', 'Asia'),
  ('AF', 'Africa');

-- currency
INSERT INTO geografia.currency (iso_currency_code, currency_name, currency_symbol, minor_units) VALUES
  ('USD', 'United States Dollar', '$', 2),
  ('COP', 'Colombian Peso', 'COP', 2),
  ('EUR', 'Euro', '€', 2),
  ('JPY', 'Japanese Yen', '¥', 0),
  ('GBP', 'British Pound', '£', 2);

-- country
INSERT INTO geografia.country (continent_id, iso_alpha2, iso_alpha3, country_name) VALUES
  ((SELECT continent_id FROM geografia.continent WHERE continent_code='SA'), 'CO', 'COL', 'Colombia'),
  ((SELECT continent_id FROM geografia.continent WHERE continent_code='NA'), 'MX', 'MEX', 'Mexico'),
  ((SELECT continent_id FROM geografia.continent WHERE continent_code='NA'), 'US', 'USA', 'United States'),
  ((SELECT continent_id FROM geografia.continent WHERE continent_code='EU'), 'ES', 'ESP', 'Spain'),
  ((SELECT continent_id FROM geografia.continent WHERE continent_code='AS'), 'JP', 'JPN', 'Japan');

-- state_province
INSERT INTO geografia.state_province (country_id, state_code, state_name) VALUES
  ((SELECT country_id FROM geografia.country WHERE iso_alpha2='CO'), 'DC', 'Distrito Capital'),
  ((SELECT country_id FROM geografia.country WHERE iso_alpha2='CO'), 'AT', 'Atlantico'),
  ((SELECT country_id FROM geografia.country WHERE iso_alpha2='MX'), 'MX', 'Ciudad de Mexico'),
  ((SELECT country_id FROM geografia.country WHERE iso_alpha2='US'), 'NY', 'New York'),
  ((SELECT country_id FROM geografia.country WHERE iso_alpha2='US'), 'CA', 'California');

-- city
INSERT INTO geografia.city (state_province_id, time_zone_id, city_name) VALUES
  ((SELECT state_province_id FROM geografia.state_province WHERE state_code='DC'), (SELECT time_zone_id FROM geografia.time_zone WHERE time_zone_name='America/Bogota'), 'Bogota'),
  ((SELECT state_province_id FROM geografia.state_province WHERE state_code='AT'), (SELECT time_zone_id FROM geografia.time_zone WHERE time_zone_name='America/Bogota'), 'Barranquilla'),
  ((SELECT state_province_id FROM geografia.state_province WHERE state_code='MX'), (SELECT time_zone_id FROM geografia.time_zone WHERE time_zone_name='America/Mexico_City'), 'Mexico City'),
  ((SELECT state_province_id FROM geografia.state_province WHERE state_code='NY'), (SELECT time_zone_id FROM geografia.time_zone WHERE time_zone_name='America/New_York'), 'New York City'),
  ((SELECT state_province_id FROM geografia.state_province WHERE state_code='CA'), (SELECT time_zone_id FROM geografia.time_zone WHERE time_zone_name='America/New_York'), 'Los Angeles');

-- district
INSERT INTO geografia.district (city_id, district_name) VALUES
  ((SELECT city_id FROM geografia.city WHERE city_name='Bogota'), 'Chapinero'),
  ((SELECT city_id FROM geografia.city WHERE city_name='Bogota'), 'La Candelaria'),
  ((SELECT city_id FROM geografia.city WHERE city_name='Mexico City'), 'Benito Juarez'),
  ((SELECT city_id FROM geografia.city WHERE city_name='New York City'), 'Manhattan'),
  ((SELECT city_id FROM geografia.city WHERE city_name='Los Angeles'), 'Hollywood Hills');

-- address
INSERT INTO geografia.address (district_id, address_line_1, address_line_2, postal_code, latitude, longitude) VALUES
  ((SELECT district_id FROM geografia.district WHERE district_name='Chapinero'), 'Calle 72 #10-50', NULL, '110221', 4.6680, -74.0520),
  ((SELECT district_id FROM geografia.district WHERE district_name='La Candelaria'), 'Carrera 8 #12-34', NULL, '110111', 4.5981, -74.0758),
  ((SELECT district_id FROM geografia.district WHERE district_name='Benito Juarez'), 'Av. Paseo de la Reforma 300', NULL, '06500', 19.4270, -99.1677),
  ((SELECT district_id FROM geografia.district WHERE district_name='Manhattan'), '5th Avenue 350', NULL, '10118', 40.7750, -73.9655),
  ((SELECT district_id FROM geografia.district WHERE district_name='Hollywood Hills'), 'Hollywood Blvd 6925', NULL, '90028', 34.0983, -118.3258);
