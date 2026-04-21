-- Insert de datos de prueba para el dominio VENTAS
-- Depende de operaciones, clientes, aeronaves y geografía

-- reservation_status
INSERT INTO ventas.reservation_status (status_code, status_name) VALUES
  ('CONFIRMED', 'Confirmed'),
  ('CANCELLED', 'Cancelled');

-- sale_channel
INSERT INTO ventas.sale_channel (channel_code, channel_name) VALUES
  ('ONLINE', 'Online'),
  ('AGENT', 'Travel Agent');

-- fare_class
INSERT INTO ventas.fare_class (cabin_class_id, fare_class_code, fare_class_name, is_refundable_by_default) VALUES
  ((SELECT cabin_class_id FROM aeronaves.cabin_class WHERE class_code='ECON'), 'ECON', 'Economy', false),
  ((SELECT cabin_class_id FROM aeronaves.cabin_class WHERE class_code='BUS'), 'BUS', 'Business', true);

-- fare
INSERT INTO ventas.fare (airline_id, origin_airport_id, destination_airport_id, fare_class_id, currency_id, fare_code, base_amount, valid_from, valid_to, baggage_allowance_qty) VALUES
  ((SELECT airline_id FROM aerolinea.airline WHERE airline_code='ALCO'), (SELECT airport_id FROM aeropuerto.airport WHERE iata_code='BOG'), (SELECT airport_id FROM aeropuerto.airport WHERE iata_code='MEX'), (SELECT fare_class_id FROM ventas.fare_class WHERE fare_class_code='ECON'), (SELECT currency_id FROM geografia.currency WHERE iso_currency_code='COP'), 'FCOBOG001', 850000, '2026-01-01', '2026-12-31', 1),
  ((SELECT airline_id FROM aerolinea.airline WHERE airline_code='ALUS'), (SELECT airport_id FROM aeropuerto.airport WHERE iata_code='JFK'), (SELECT airport_id FROM aeropuerto.airport WHERE iata_code='BOG'), (SELECT fare_class_id FROM ventas.fare_class WHERE fare_class_code='BUS'), (SELECT currency_id FROM geografia.currency WHERE iso_currency_code='USD'), 'FUSAJFK002', 1200.00, '2026-01-01', '2026-12-31', 2);

-- ticket_status
INSERT INTO ventas.ticket_status (status_code, status_name) VALUES
  ('ISSUED', 'Issued'),
  ('CANCELLED', 'Cancelled');

-- reservation
INSERT INTO ventas.reservation (booked_by_customer_id, reservation_status_id, sale_channel_id, reservation_code, booked_at, expires_at) VALUES
  ((SELECT customer_id FROM clientes.customer WHERE customer_category_id = (SELECT customer_category_id FROM clientes.customer_category WHERE category_code='PREMIUM')), (SELECT reservation_status_id FROM ventas.reservation_status WHERE status_code='CONFIRMED'), (SELECT sale_channel_id FROM ventas.sale_channel WHERE channel_code='ONLINE'), 'RES-1001', now(), now() + interval '2 days'),
  ((SELECT customer_id FROM clientes.customer WHERE customer_category_id = (SELECT customer_category_id FROM clientes.customer_category WHERE category_code='STANDARD')), (SELECT reservation_status_id FROM ventas.reservation_status WHERE status_code='CONFIRMED'), (SELECT sale_channel_id FROM ventas.sale_channel WHERE channel_code='AGENT'), 'RES-1002', now(), now() + interval '2 days');

-- reservation_passenger
INSERT INTO ventas.reservation_passenger (reservation_id, person_id, passenger_sequence_no, passenger_type) VALUES
  ((SELECT reservation_id FROM ventas.reservation WHERE reservation_code='RES-1001'), (SELECT person_id FROM identidad.person WHERE last_name='Perez'), 1, 'ADULT'),
  ((SELECT reservation_id FROM ventas.reservation WHERE reservation_code='RES-1002'), (SELECT person_id FROM identidad.person WHERE last_name='Garcia'), 1, 'ADULT');

-- sale
INSERT INTO ventas.sale (reservation_id, currency_id, sale_code, sold_at, external_reference) VALUES
  ((SELECT reservation_id FROM ventas.reservation WHERE reservation_code='RES-1001'), (SELECT currency_id FROM geografia.currency WHERE iso_currency_code='COP'), 'SALE-1001', now(), 'EXT-1001'),
  ((SELECT reservation_id FROM ventas.reservation WHERE reservation_code='RES-1002'), (SELECT currency_id FROM geografia.currency WHERE iso_currency_code='USD'), 'SALE-1002', now(), 'EXT-1002');

-- ticket
INSERT INTO ventas.ticket (sale_id, reservation_passenger_id, fare_id, ticket_status_id, ticket_number, issued_at) VALUES
  ((SELECT sale_id FROM ventas.sale WHERE sale_code='SALE-1001'), (SELECT reservation_passenger_id FROM ventas.reservation_passenger WHERE reservation_id=(SELECT reservation_id FROM ventas.reservation WHERE reservation_code='RES-1001')), (SELECT fare_id FROM ventas.fare WHERE fare_code='FCOBOG001'), (SELECT ticket_status_id FROM ventas.ticket_status WHERE status_code='ISSUED'), 'TCK-1001', now()),
  ((SELECT sale_id FROM ventas.sale WHERE sale_code='SALE-1002'), (SELECT reservation_passenger_id FROM ventas.reservation_passenger WHERE reservation_id=(SELECT reservation_id FROM ventas.reservation WHERE reservation_code='RES-1002')), (SELECT fare_id FROM ventas.fare WHERE fare_code='FUSAJFK002'), (SELECT ticket_status_id FROM ventas.ticket_status WHERE status_code='ISSUED'), 'TCK-1002', now());

-- ticket_segment
INSERT INTO ventas.ticket_segment (ticket_id, flight_segment_id, segment_sequence_no, fare_basis_code) VALUES
  ((SELECT ticket_id FROM ventas.ticket WHERE ticket_number='TCK-1001'), (SELECT flight_segment_id FROM operaciones.flight_segment WHERE flight_id=(SELECT flight_id FROM operaciones.flight WHERE flight_number='AC101')), 1, 'Y1'),
  ((SELECT ticket_id FROM ventas.ticket WHERE ticket_number='TCK-1002'), (SELECT flight_segment_id FROM operaciones.flight_segment WHERE flight_id=(SELECT flight_id FROM operaciones.flight WHERE flight_number='UA202')), 1, 'J1');

-- seat_assignment
INSERT INTO ventas.seat_assignment (ticket_segment_id, flight_segment_id, aircraft_seat_id, assigned_at, assignment_source) VALUES
  ((SELECT ticket_segment_id FROM ventas.ticket_segment WHERE ticket_id=(SELECT ticket_id FROM ventas.ticket WHERE ticket_number='TCK-1001')), (SELECT flight_segment_id FROM ventas.ticket_segment WHERE ticket_id=(SELECT ticket_id FROM ventas.ticket WHERE ticket_number='TCK-1001')), (SELECT aircraft_seat_id FROM aeronaves.aircraft_seat WHERE seat_row_number=10 AND seat_column_code='A'), now(), 'AUTO'),
  ((SELECT ticket_segment_id FROM ventas.ticket_segment WHERE ticket_id=(SELECT ticket_id FROM ventas.ticket WHERE ticket_number='TCK-1002')), (SELECT flight_segment_id FROM ventas.ticket_segment WHERE ticket_id=(SELECT ticket_id FROM ventas.ticket WHERE ticket_number='TCK-1002')), (SELECT aircraft_seat_id FROM aeronaves.aircraft_seat WHERE seat_row_number=12 AND seat_column_code='C'), now(), 'AUTO');

-- baggage
INSERT INTO ventas.baggage (ticket_segment_id, baggage_tag, baggage_type, baggage_status, weight_kg, checked_at) VALUES
  ((SELECT ticket_segment_id FROM ventas.ticket_segment WHERE ticket_id=(SELECT ticket_id FROM ventas.ticket WHERE ticket_number='TCK-1001')), 'BG-1001', 'CHECKED', 'REGISTERED', 23.50, now()),
  ((SELECT ticket_segment_id FROM ventas.ticket_segment WHERE ticket_id=(SELECT ticket_id FROM ventas.ticket WHERE ticket_number='TCK-1002')), 'BG-1002', 'CARRY_ON', 'REGISTERED', 7.00, now());
