-- Rollback for 001_insert_geografia.sql
DELETE FROM geografia.address WHERE address_line_1 IN (
  'Calle 72 #10-50',
  'Carrera 8 #12-34',
  'Av. Paseo de la Reforma 300',
  '5th Avenue 350',
  'Hollywood Blvd 6925'
);
DELETE FROM geografia.district WHERE district_name IN (
  'Chapinero',
  'La Candelaria',
  'Benito Juarez',
  'Manhattan',
  'Hollywood Hills'
);
DELETE FROM geografia.city WHERE city_name IN (
  'Bogota',
  'Barranquilla',
  'Mexico City',
  'New York City',
  'Los Angeles'
);
DELETE FROM geografia.state_province WHERE state_code IN ('DC', 'AT', 'MX', 'NY', 'CA');
DELETE FROM geografia.country WHERE iso_alpha2 IN ('CO', 'MX', 'US', 'ES', 'JP');
DELETE FROM geografia.currency WHERE iso_currency_code IN ('USD', 'COP', 'EUR', 'JPY', 'GBP');
DELETE FROM geografia.continent WHERE continent_code IN ('NA', 'SA', 'EU', 'AS', 'AF');
DELETE FROM geografia.time_zone WHERE time_zone_name IN ('America/Bogota', 'America/Mexico_City', 'America/New_York', 'Europe/Madrid', 'Asia/Tokyo');
