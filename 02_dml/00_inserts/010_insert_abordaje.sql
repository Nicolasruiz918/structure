-- Insert de datos de prueba para el dominio ABORDAJE
-- Depende de ventas, aeropuerto y seguridad

-- boarding_group
INSERT INTO abordaje.boarding_group (group_code, group_name, sequence_no) VALUES
  ('G1', 'Group 1', 1),
  ('G2', 'Group 2', 2);

-- check_in_status
INSERT INTO abordaje.check_in_status (status_code, status_name) VALUES
  ('COMPLETED', 'Completed'),
  ('PENDING', 'Pending');

-- check_in
INSERT INTO abordaje.check_in (ticket_segment_id, check_in_status_id, boarding_group_id, checked_in_by_user_id, checked_in_at) VALUES
  ((SELECT ticket_segment_id FROM ventas.ticket_segment WHERE ticket_id=(SELECT ticket_id FROM ventas.ticket WHERE ticket_number='TCK-1001')), (SELECT check_in_status_id FROM abordaje.check_in_status WHERE status_code='COMPLETED'), (SELECT boarding_group_id FROM abordaje.boarding_group WHERE group_code='G1'), (SELECT user_account_id FROM seguridad.user_account WHERE username='juan.perez'), now()),
  ((SELECT ticket_segment_id FROM ventas.ticket_segment WHERE ticket_id=(SELECT ticket_id FROM ventas.ticket WHERE ticket_number='TCK-1002')), (SELECT check_in_status_id FROM abordaje.check_in_status WHERE status_code='COMPLETED'), (SELECT boarding_group_id FROM abordaje.boarding_group WHERE group_code='G2'), (SELECT user_account_id FROM seguridad.user_account WHERE username='maria.garcia'), now());

-- boarding_pass
INSERT INTO abordaje.boarding_pass (check_in_id, boarding_pass_code, barcode_value, issued_at) VALUES
  ((SELECT check_in_id FROM abordaje.check_in WHERE ticket_segment_id=(SELECT ticket_segment_id FROM ventas.ticket_segment WHERE ticket_id=(SELECT ticket_id FROM ventas.ticket WHERE ticket_number='TCK-1001'))), 'BP-1001', 'BAR1001', now()),
  ((SELECT check_in_id FROM abordaje.check_in WHERE ticket_segment_id=(SELECT ticket_segment_id FROM ventas.ticket_segment WHERE ticket_id=(SELECT ticket_id FROM ventas.ticket WHERE ticket_number='TCK-1002'))), 'BP-1002', 'BAR1002', now());

-- boarding_validation
INSERT INTO abordaje.boarding_validation (boarding_pass_id, boarding_gate_id, validated_by_user_id, validated_at, validation_result, notes) VALUES
  ((SELECT boarding_pass_id FROM abordaje.boarding_pass WHERE boarding_pass_code='BP-1001'), (SELECT boarding_gate_id FROM aeropuerto.boarding_gate WHERE gate_code='A01'), (SELECT user_account_id FROM seguridad.user_account WHERE username='juan.perez'), now(), 'APPROVED', 'Boarding approved'),
  ((SELECT boarding_pass_id FROM abordaje.boarding_pass WHERE boarding_pass_code='BP-1002'), (SELECT boarding_gate_id FROM aeropuerto.boarding_gate WHERE gate_code='B12'), (SELECT user_account_id FROM seguridad.user_account WHERE username='maria.garcia'), now(), 'APPROVED', 'Boarding approved');
