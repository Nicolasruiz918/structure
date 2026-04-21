-- Insert de datos de prueba para el dominio NOTIFICACIONES

-- notification_type
INSERT INTO notificaciones.notification_type (type_code, type_name, type_description, requires_confirmation) VALUES
  ('BOOKING_CONFIRMATION', 'Booking Confirmation', 'Confirmation messages for new bookings', true),
  ('PAYMENT_RECEIPT', 'Payment Receipt', 'Receipt for completed payments', false);

-- notification_channel
INSERT INTO notificaciones.notification_channel (channel_code, channel_name, max_retries, retry_delay_seconds, is_active) VALUES
  ('EMAIL', 'Email', 3, 300, true),
  ('SMS', 'SMS', 3, 300, true);

-- notification_template
INSERT INTO notificaciones.notification_template (notification_type_id, notification_channel_id, template_code, subject_template, body_template, language_code, is_active) VALUES
  ((SELECT notification_type_id FROM notificaciones.notification_type WHERE type_code='BOOKING_CONFIRMATION'), (SELECT notification_channel_id FROM notificaciones.notification_channel WHERE channel_code='EMAIL'), 'TPL_BOOKING_EMAIL', 'Booking Confirmed', 'Dear customer, your booking is confirmed.', 'es', true),
  ((SELECT notification_type_id FROM notificaciones.notification_type WHERE type_code='PAYMENT_RECEIPT'), (SELECT notification_channel_id FROM notificaciones.notification_channel WHERE channel_code='EMAIL'), 'TPL_PAYMENT_EMAIL', 'Payment Received', 'Thank you for your payment.', 'es', true);

-- notification
INSERT INTO notificaciones.notification (notification_template_id, recipient_email, notification_subject, notification_body, notification_status, sent_at, delivered_at, confirmed_at) VALUES
  ((SELECT notification_template_id FROM notificaciones.notification_template WHERE template_code='TPL_BOOKING_EMAIL'), 'cliente@example.com', 'Booking Confirmed', 'Dear customer, your booking is confirmed.', 'SENT', now(), now(), now()),
  ((SELECT notification_template_id FROM notificaciones.notification_template WHERE template_code='TPL_PAYMENT_EMAIL'), 'cliente@example.com', 'Payment Received', 'Thank you for your payment.', 'SENT', now(), now(), now());
