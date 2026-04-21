-- ============================================
-- AERONAVES - Rollback Índices
-- ============================================

DROP INDEX IF EXISTS aeronaves.idx_aircraft_airline_id;
DROP INDEX IF EXISTS aeronaves.idx_aircraft_model_id;
DROP INDEX IF EXISTS aeronaves.idx_aircraft_cabin_aircraft_id;
DROP INDEX IF EXISTS aeronaves.idx_aircraft_seat_cabin_id;
DROP INDEX IF EXISTS aeronaves.idx_maintenance_event_aircraft_id;
