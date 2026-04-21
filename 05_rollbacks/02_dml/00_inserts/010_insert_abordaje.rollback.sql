-- Rollback for 010_insert_abordaje.sql
DELETE FROM abordaje.boarding_validation WHERE validation_result = 'APPROVED' AND notes = 'Boarding approved';
DELETE FROM abordaje.boarding_pass WHERE boarding_pass_code IN ('BP-1001', 'BP-1002');
DELETE FROM abordaje.check_in WHERE checked_in_at IS NOT NULL AND ticket_segment_id IN (
  SELECT ticket_segment_id FROM ventas.ticket_segment WHERE ticket_id IN (
    SELECT ticket_id FROM ventas.ticket WHERE ticket_number IN ('TCK-1001', 'TCK-1002')
  )
);
DELETE FROM abordaje.boarding_group WHERE group_code IN ('G1', 'G2');
DELETE FROM abordaje.check_in_status WHERE status_code IN ('COMPLETED', 'PENDING');
