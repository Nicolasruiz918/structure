-- Rollback for 007_insert_aeronaves.sql
DELETE FROM aeronaves.maintenance_event WHERE notes IN ('Routine A check', 'Scheduled B check');
DELETE FROM aeronaves.aircraft_seat WHERE seat_row_number IN (10, 12) AND seat_column_code IN ('A', 'B', 'C');
DELETE FROM aeronaves.aircraft_cabin WHERE cabin_code IN ('C1', 'C2');
DELETE FROM aeronaves.aircraft WHERE registration_number IN ('HK-1234', 'N123UA');
DELETE FROM aeronaves.maintenance_provider WHERE provider_name IN ('Mantenimiento Colombia S.A.', 'Maintenance USA LLC');
DELETE FROM aeronaves.maintenance_type WHERE type_code IN ('A_CHECK', 'B_CHECK');
DELETE FROM aeronaves.aircraft_model WHERE model_code IN ('A320', 'B737');
DELETE FROM aeronaves.cabin_class WHERE class_code IN ('ECON', 'BUS', 'FIRST');
DELETE FROM aeronaves.aircraft_manufacturer WHERE manufacturer_name IN ('Airbus', 'Boeing');
