-- ============================================
-- NOTIFICACIONES - Rollback Índices
-- ============================================

DROP INDEX IF EXISTS notificaciones.idx_notification_status;
DROP INDEX IF EXISTS notificaciones.idx_notification_type_id;
DROP INDEX IF EXISTS notificaciones.idx_notification_channel_id;
DROP INDEX IF EXISTS notificaciones.idx_notification_created_at;
DROP INDEX IF EXISTS notificaciones.idx_notification_recipient_email;
