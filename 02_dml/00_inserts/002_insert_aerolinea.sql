-- Insert de datos de prueba para el dominio AEROLÍNEA
-- Depende de geografía

INSERT INTO aerolinea.airline (home_country_id, airline_code, airline_name, iata_code, icao_code) VALUES
  ((SELECT country_id FROM geografia.country WHERE iso_alpha2='CO'), 'ALCO', 'Aerolínea Colombia', 'AC', 'ACO'),
  ((SELECT country_id FROM geografia.country WHERE iso_alpha2='MX'), 'ALMX', 'Airline Mexico', 'AM', 'AMX'),
  ((SELECT country_id FROM geografia.country WHERE iso_alpha2='US'), 'ALUS', 'Airline United States', 'UA', 'USA'),
  ((SELECT country_id FROM geografia.country WHERE iso_alpha2='ES'), 'ALEU', 'Airline Europe', 'IB', 'IBE'),
  ((SELECT country_id FROM geografia.country WHERE iso_alpha2='JP'), 'ALJP', 'Airline Asia', 'JL', 'JAL');
