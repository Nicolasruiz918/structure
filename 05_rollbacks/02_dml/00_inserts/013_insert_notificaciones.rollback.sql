-- Rollback for 013_insert_notificaciones.sql
DELETE FROM notificaciones.notification WHERE recipient_email = 'cliente@example.com' AND notification_subject IN ('Booking Confirmed', 'Payment Received');
DELETE FROM notificaciones.notification_template WHERE template_code IN ('TPL_BOOKING_EMAIL', 'TPL_PAYMENT_EMAIL');
DELETE FROM notificaciones.notification_channel WHERE channel_code IN ('EMAIL', 'SMS');
DELETE FROM notificaciones.notification_type WHERE type_code IN ('BOOKING_CONFIRMATION', 'PAYMENT_RECEIPT');
