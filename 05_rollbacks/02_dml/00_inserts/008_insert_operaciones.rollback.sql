-- Rollback for 008_insert_operaciones.sql
DELETE FROM operaciones.flight_delay WHERE notes = 'Thunderstorm delay';
DELETE FROM operaciones.flight_segment WHERE segment_number = 1 AND flight_id IN (
  SELECT flight_id FROM operaciones.flight WHERE flight_number IN ('AC101', 'UA202')
);
DELETE FROM operaciones.flight WHERE flight_number IN ('AC101', 'UA202');
DELETE FROM operaciones.delay_reason_type WHERE reason_code IN ('WX', 'TECH', 'ATC');
DELETE FROM operaciones.flight_status WHERE status_code IN ('SCHEDULED', 'DELAYED', 'COMPLETED');
