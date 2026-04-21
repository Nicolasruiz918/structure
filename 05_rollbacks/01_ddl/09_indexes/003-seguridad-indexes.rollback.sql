-- ============================================
-- SEGURIDAD - Rollback Índices
-- ============================================

DROP INDEX IF EXISTS seguridad.idx_user_account_status_id;
DROP INDEX IF EXISTS seguridad.idx_user_role_user_account_id;
DROP INDEX IF EXISTS seguridad.idx_user_role_role_id;
DROP INDEX IF EXISTS seguridad.idx_role_permission_role_id;
DROP INDEX IF EXISTS seguridad.idx_role_permission_permission_id;
