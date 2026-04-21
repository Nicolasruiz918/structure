-- ============================================
-- ROLLBACK: Eliminar políticas de NOTIFICACIONES
-- ============================================

DROP POLICY IF EXISTS notification_admin_policy ON notificaciones.notification;
DROP POLICY IF EXISTS notification_system_policy ON notificaciones.notification;
DROP POLICY IF EXISTS notification_cliente_policy ON notificaciones.notification;

RAISE NOTICE '✓ Políticas de notificaciones eliminadas';