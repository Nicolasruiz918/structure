-- Rollback for 004_insert_seguridad.sql
DELETE FROM seguridad.role_permission WHERE granted_at IS NOT NULL AND security_permission_id IN (
  SELECT security_permission_id FROM seguridad.security_permission WHERE permission_code IN ('VIEW_FLIGHTS', 'MANAGE_RESERVATIONS', 'PROCESS_PAYMENTS')
);
DELETE FROM seguridad.user_role WHERE security_role_id IN (
  SELECT security_role_id FROM seguridad.security_role WHERE role_code IN ('ADMIN', 'AGENT', 'ANALYST')
);
DELETE FROM seguridad.user_account WHERE username IN ('juan.perez', 'maria.garcia', 'carlos.lopez');
DELETE FROM seguridad.security_permission WHERE permission_code IN ('VIEW_FLIGHTS', 'MANAGE_RESERVATIONS', 'PROCESS_PAYMENTS');
DELETE FROM seguridad.security_role WHERE role_code IN ('ADMIN', 'AGENT', 'ANALYST');
DELETE FROM seguridad.user_status WHERE status_code IN ('ACTIVE', 'SUSPENDED', 'LOCKED');
