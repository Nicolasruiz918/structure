-- Insert de datos de prueba para el dominio OPERACIONES
-- Depende de aerolínea, aeronaves y aeropuerto

-- flight_status
INSERT INTO operaciones.flight_status (status_code, status_name) VALUES
  ('SCHEDULED', 'Scheduled'),
  ('DELAYED', 'Delayed'),
  ('COMPLETED', 'Completed');

-- delay_reason_type
INSERT INTO operaciones.delay_reason_type (reason_code, reason_name) VALUES
  ('WX', 'Weather'),
  ('TECH', 'Technical Issue'),
  ('ATC', 'Air Traffic Control');

-- flight
INSERT INTO operaciones.flight (airline_id, aircraft_id, flight_status_id, flight_number, service_date) VALUES
  ((SELECT airline_id FROM aerolinea.airline WHERE airline_code='ALCO'), (SELECT aircraft_id FROM aeronaves.aircraft WHERE registration_number='HK-1234'), (SELECT flight_status_id FROM operaciones.flight_status WHERE status_code='SCHEDULED'), 'AC101', '2026-05-15'),
  ((SELECT airline_id FROM aerolinea.airline WHERE airline_code='ALUS'), (SELECT aircraft_id FROM aeronaves.aircraft WHERE registration_number='N123UA'), (SELECT flight_status_id FROM operaciones.flight_status WHERE status_code='SCHEDULED'), 'UA202', '2026-05-16');

-- flight_segment
INSERT INTO operaciones.flight_segment (flight_id, origin_airport_id, destination_airport_id, segment_number, scheduled_departure_at, scheduled_arrival_at) VALUES
  ((SELECT flight_id FROM operaciones.flight WHERE flight_number='AC101'), (SELECT airport_id FROM aeropuerto.airport WHERE iata_code='BOG'), (SELECT airport_id FROM aeropuerto.airport WHERE iata_code='MEX'), 1, '2026-05-15 08:00:00-05', '2026-05-15 11:30:00-06'),
  ((SELECT flight_id FROM operaciones.flight WHERE flight_number='UA202'), (SELECT airport_id FROM aeropuerto.airport WHERE iata_code='JFK'), (SELECT airport_id FROM aeropuerto.airport WHERE iata_code='BOG'), 1, '2026-05-16 09:00:00-04', '2026-05-16 17:30:00-05');

-- flight_delay
INSERT INTO operaciones.flight_delay (flight_segment_id, delay_reason_type_id, reported_at, delay_minutes, notes) VALUES
  ((SELECT flight_segment_id FROM operaciones.flight_segment WHERE segment_number=1 AND flight_id=(SELECT flight_id FROM operaciones.flight WHERE flight_number='AC101')), (SELECT delay_reason_type_id FROM operaciones.delay_reason_type WHERE reason_code='WX'), now(), 45, 'Thunderstorm delay');
