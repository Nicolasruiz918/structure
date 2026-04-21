-- Insert de datos de prueba para el dominio AEROPUERTO
-- Depende de geografía

-- airport
INSERT INTO aeropuerto.airport (address_id, airport_name, iata_code, icao_code) VALUES
  ((SELECT address_id FROM geografia.address WHERE address_line_1 LIKE 'Calle 72%'), 'Aeropuerto El Dorado', 'BOG', 'SKBO'),
  ((SELECT address_id FROM geografia.address WHERE address_line_1 LIKE 'Av. Paseo de la Reforma%'), 'Aeropuerto Benito Juarez', 'MEX', 'MMMX'),
  ((SELECT address_id FROM geografia.address WHERE address_line_1 LIKE '5th Avenue%'), 'Aeropuerto JFK', 'JFK', 'KJFK');

-- terminal
INSERT INTO aeropuerto.terminal (airport_id, terminal_code, terminal_name) VALUES
  ((SELECT airport_id FROM aeropuerto.airport WHERE iata_code='BOG'), 'T1', 'Terminal 1'),
  ((SELECT airport_id FROM aeropuerto.airport WHERE iata_code='MEX'), 'T2', 'Terminal 2'),
  ((SELECT airport_id FROM aeropuerto.airport WHERE iata_code='JFK'), 'T4', 'Terminal 4');

-- boarding_gate
INSERT INTO aeropuerto.boarding_gate (terminal_id, gate_code, is_active) VALUES
  ((SELECT terminal_id FROM aeropuerto.terminal WHERE terminal_code='T1'), 'A01', true),
  ((SELECT terminal_id FROM aeropuerto.terminal WHERE terminal_code='T2'), 'B12', true),
  ((SELECT terminal_id FROM aeropuerto.terminal WHERE terminal_code='T4'), 'C23', true);

-- runway
INSERT INTO aeropuerto.runway (airport_id, runway_code, length_meters, surface_type) VALUES
  ((SELECT airport_id FROM aeropuerto.airport WHERE iata_code='BOG'), '10L/28R', 3200, 'Asphalt'),
  ((SELECT airport_id FROM aeropuerto.airport WHERE iata_code='MEX'), '05R/23L', 3950, 'Concrete'),
  ((SELECT airport_id FROM aeropuerto.airport WHERE iata_code='JFK'), '13L/31R', 4442, 'Concrete');

-- airport_regulation
INSERT INTO aeropuerto.airport_regulation (airport_id, regulation_code, regulation_title, issuing_authority, effective_from, effective_to) VALUES
  ((SELECT airport_id FROM aeropuerto.airport WHERE iata_code='BOG'), 'REG-001', 'Security Protocol A', 'Aerocivil', '2024-01-01', NULL),
  ((SELECT airport_id FROM aeropuerto.airport WHERE iata_code='MEX'), 'REG-002', 'Noise Control', 'AFAC', '2024-03-01', NULL),
  ((SELECT airport_id FROM aeropuerto.airport WHERE iata_code='JFK'), 'REG-003', 'Passenger Screening', 'TSA', '2024-02-01', NULL);
