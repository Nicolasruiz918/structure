-- ============================================
-- NOTIFICACIONES - Índices
-- ============================================

CREATE INDEX idx_notification_status ON notificaciones.notification(notification_status);
CREATE INDEX idx_notification_type_id ON notificaciones.notification_template(notification_type_id);
CREATE INDEX idx_notification_channel_id ON notificaciones.notification_template(notification_channel_id);
CREATE INDEX idx_notification_created_at ON notificaciones.notification(created_at);
CREATE INDEX idx_notification_recipient_email ON notificaciones.notification(recipient_email);
