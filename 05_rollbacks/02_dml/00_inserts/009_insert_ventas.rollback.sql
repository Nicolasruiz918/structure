-- Rollback for 009_insert_ventas.sql
DELETE FROM ventas.baggage WHERE baggage_tag IN ('BG-1001', 'BG-1002');
DELETE FROM ventas.seat_assignment WHERE assignment_source = 'AUTO' AND assigned_at IS NOT NULL;
DELETE FROM ventas.ticket_segment WHERE segment_sequence_no = 1 AND ticket_id IN (
  SELECT ticket_id FROM ventas.ticket WHERE ticket_number IN ('TCK-1001', 'TCK-1002')
);
DELETE FROM ventas.ticket WHERE ticket_number IN ('TCK-1001', 'TCK-1002');
DELETE FROM ventas.sale WHERE sale_code IN ('SALE-1001', 'SALE-1002');
DELETE FROM ventas.reservation_passenger WHERE reservation_id IN (
  SELECT reservation_id FROM ventas.reservation WHERE reservation_code IN ('RES-1001', 'RES-1002')
);
DELETE FROM ventas.reservation WHERE reservation_code IN ('RES-1001', 'RES-1002');
DELETE FROM ventas.ticket_status WHERE status_code IN ('ISSUED', 'CANCELLED');
DELETE FROM ventas.fare WHERE fare_code IN ('FCOBOG001', 'FUSAJFK002');
DELETE FROM ventas.fare_class WHERE fare_class_code IN ('ECON', 'BUS');
DELETE FROM ventas.sale_channel WHERE channel_code IN ('ONLINE', 'AGENT');
DELETE FROM ventas.reservation_status WHERE status_code IN ('CONFIRMED', 'CANCELLED');
