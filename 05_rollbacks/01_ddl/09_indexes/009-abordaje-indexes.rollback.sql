-- ============================================
-- ABORDAJE - Rollback Índices
-- ============================================

DROP INDEX IF EXISTS abordaje.idx_check_in_status_id;
DROP INDEX IF EXISTS abordaje.idx_boarding_pass_check_in_id;
DROP INDEX IF EXISTS abordaje.idx_boarding_validation_boarding_pass_id;
