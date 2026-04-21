-- Insert de datos de prueba para el dominio AERONAVES
-- Depende de aerolínea y geografía

-- aircraft_manufacturer
INSERT INTO aeronaves.aircraft_manufacturer (manufacturer_name) VALUES
  ('Airbus'),
  ('Boeing');

-- aircraft_model
INSERT INTO aeronaves.aircraft_model (aircraft_manufacturer_id, model_code, model_name, max_range_km) VALUES
  ((SELECT aircraft_manufacturer_id FROM aeronaves.aircraft_manufacturer WHERE manufacturer_name='Airbus'), 'A320', 'Airbus A320', 6100),
  ((SELECT aircraft_manufacturer_id FROM aeronaves.aircraft_manufacturer WHERE manufacturer_name='Boeing'), 'B737', 'Boeing 737', 6200);

-- cabin_class
INSERT INTO aeronaves.cabin_class (class_code, class_name) VALUES
  ('ECON', 'Economy'),
  ('BUS', 'Business'),
  ('FIRST', 'First Class');

-- aircraft
INSERT INTO aeronaves.aircraft (airline_id, aircraft_model_id, registration_number, serial_number, in_service_on) VALUES
  ((SELECT airline_id FROM aerolinea.airline WHERE airline_code='ALCO'), (SELECT aircraft_model_id FROM aeronaves.aircraft_model WHERE model_code='A320'), 'HK-1234', 'SN-A320-001', '2019-05-10'),
  ((SELECT airline_id FROM aerolinea.airline WHERE airline_code='ALUS'), (SELECT aircraft_model_id FROM aeronaves.aircraft_model WHERE model_code='B737'), 'N123UA', 'SN-B737-001', '2020-08-20');

-- aircraft_cabin
INSERT INTO aeronaves.aircraft_cabin (aircraft_id, cabin_class_id, cabin_code, deck_number) VALUES
  ((SELECT aircraft_id FROM aeronaves.aircraft WHERE registration_number='HK-1234'), (SELECT cabin_class_id FROM aeronaves.cabin_class WHERE class_code='ECON'), 'C1', 1),
  ((SELECT aircraft_id FROM aeronaves.aircraft WHERE registration_number='HK-1234'), (SELECT cabin_class_id FROM aeronaves.cabin_class WHERE class_code='BUS'), 'C2', 1),
  ((SELECT aircraft_id FROM aeronaves.aircraft WHERE registration_number='N123UA'), (SELECT cabin_class_id FROM aeronaves.cabin_class WHERE class_code='ECON'), 'C1', 1);

-- aircraft_seat
INSERT INTO aeronaves.aircraft_seat (aircraft_cabin_id, seat_row_number, seat_column_code, is_window, is_aisle, is_exit_row) VALUES
  ((SELECT aircraft_cabin_id FROM aeronaves.aircraft_cabin WHERE cabin_code='C1' AND aircraft_id = (SELECT aircraft_id FROM aeronaves.aircraft WHERE registration_number='HK-1234')), 10, 'A', true, false, false),
  ((SELECT aircraft_cabin_id FROM aeronaves.aircraft_cabin WHERE cabin_code='C1' AND aircraft_id = (SELECT aircraft_id FROM aeronaves.aircraft WHERE registration_number='HK-1234')), 10, 'B', false, true, false),
  ((SELECT aircraft_cabin_id FROM aeronaves.aircraft_cabin WHERE cabin_code='C2' AND aircraft_id = (SELECT aircraft_id FROM aeronaves.aircraft WHERE registration_number='HK-1234')), 1, 'A', true, false, false),
  ((SELECT aircraft_cabin_id FROM aeronaves.aircraft_cabin WHERE cabin_code='C1' AND aircraft_id = (SELECT aircraft_id FROM aeronaves.aircraft WHERE registration_number='N123UA')), 12, 'C', false, true, false);

-- maintenance_provider
INSERT INTO aeronaves.maintenance_provider (address_id, provider_name, contact_name) VALUES
  ((SELECT address_id FROM geografia.address WHERE postal_code='110221'), 'Mantenimiento Colombia S.A.', 'Andres Torres'),
  ((SELECT address_id FROM geografia.address WHERE postal_code='10118'), 'Maintenance USA LLC', 'Susan Miller');

-- maintenance_type
INSERT INTO aeronaves.maintenance_type (type_code, type_name) VALUES
  ('A_CHECK', 'A Check'),
  ('B_CHECK', 'B Check');

-- maintenance_event
INSERT INTO aeronaves.maintenance_event (aircraft_id, maintenance_type_id, maintenance_provider_id, status_code, started_at, completed_at, notes) VALUES
  ((SELECT aircraft_id FROM aeronaves.aircraft WHERE registration_number='HK-1234'), (SELECT maintenance_type_id FROM aeronaves.maintenance_type WHERE type_code='A_CHECK'), (SELECT maintenance_provider_id FROM aeronaves.maintenance_provider WHERE provider_name='Mantenimiento Colombia S.A.'), 'COMPLETED', now() - interval '30 days', now() - interval '29 days', 'Routine A check'),
  ((SELECT aircraft_id FROM aeronaves.aircraft WHERE registration_number='N123UA'), (SELECT maintenance_type_id FROM aeronaves.maintenance_type WHERE type_code='B_CHECK'), (SELECT maintenance_provider_id FROM aeronaves.maintenance_provider WHERE provider_name='Maintenance USA LLC'), 'PLANNED', now() + interval '10 days', NULL, 'Scheduled B check');
