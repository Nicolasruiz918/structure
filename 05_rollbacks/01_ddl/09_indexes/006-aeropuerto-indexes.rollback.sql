-- ============================================
-- AEROPUERTO - Rollback Índices
-- ============================================

DROP INDEX IF EXISTS aeropuerto.idx_airport_address_id;
DROP INDEX IF EXISTS aeropuerto.idx_terminal_airport_id;
DROP INDEX IF EXISTS aeropuerto.idx_boarding_gate_terminal_id;
DROP INDEX IF EXISTS aeropuerto.idx_runway_airport_id;
