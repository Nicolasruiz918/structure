-- ============================================
-- OPERACIONES - Rollback Índices
-- ============================================

DROP INDEX IF EXISTS operaciones.idx_flight_aircraft_id;
DROP INDEX IF EXISTS operaciones.idx_flight_service_date;
DROP INDEX IF EXISTS operaciones.idx_flight_segment_flight_id;
DROP INDEX IF EXISTS operaciones.idx_flight_segment_origin_airport_id;
DROP INDEX IF EXISTS operaciones.idx_flight_segment_destination_airport_id;
DROP INDEX IF EXISTS operaciones.idx_flight_delay_segment_id;
