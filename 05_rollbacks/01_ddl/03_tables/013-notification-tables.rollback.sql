-- Rollback for 013_create_notification_tables.sql

DROP INDEX IF EXISTS notificaciones.idx_notification_recipient_email CASCADE;
DROP INDEX IF EXISTS notificaciones.idx_notification_created_at CASCADE;
DROP INDEX IF EXISTS notificaciones.idx_notification_channel_id CASCADE;
DROP INDEX IF EXISTS notificaciones.idx_notification_type_id CASCADE;
DROP INDEX IF EXISTS notificaciones.idx_notification_status CASCADE;

DROP TABLE IF EXISTS notificaciones.notification CASCADE;
DROP TABLE IF EXISTS notificaciones.notification_template CASCADE;
DROP TABLE IF EXISTS notificaciones.notification_channel CASCADE;
DROP TABLE IF EXISTS notificaciones.notification_type CASCADE;
