-- Rollback for 006_insert_aeropuerto.sql
DELETE FROM aeropuerto.airport_regulation WHERE regulation_code IN ('REG-001', 'REG-002', 'REG-003');
DELETE FROM aeropuerto.runway WHERE runway_code IN ('10L/28R', '05R/23L', '13L/31R');
DELETE FROM aeropuerto.boarding_gate WHERE gate_code IN ('A01', 'B12', 'C23');
DELETE FROM aeropuerto.terminal WHERE terminal_code IN ('T1', 'T2', 'T4');
DELETE FROM aeropuerto.airport WHERE iata_code IN ('BOG', 'MEX', 'JFK');
