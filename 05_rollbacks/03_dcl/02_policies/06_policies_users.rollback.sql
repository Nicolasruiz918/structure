-- ============================================
-- ROLLBACK: Eliminar políticas de USUARIOS
-- ============================================

DROP POLICY IF EXISTS user_admin_policy ON seguridad.user_account;
DROP POLICY IF EXISTS user_self_policy ON seguridad.user_account;

RAISE NOTICE '✓ Políticas de usuarios eliminadas';