-- Insert de datos de prueba para el dominio SEGURIDAD
-- Depende de independencia de identidad

-- user_status
INSERT INTO seguridad.user_status (status_code, status_name) VALUES
  ('ACTIVE', 'Active'),
  ('SUSPENDED', 'Suspended'),
  ('LOCKED', 'Locked');

-- security_role
INSERT INTO seguridad.security_role (role_code, role_name, role_description) VALUES
  ('ADMIN', 'Administrator', 'Full system access'),
  ('AGENT', 'Agent', 'Flight operations and customer service'),
  ('ANALYST', 'Analyst', 'Reporting and read-only access');

-- security_permission
INSERT INTO seguridad.security_permission (permission_code, permission_name, permission_description) VALUES
  ('VIEW_FLIGHTS', 'View Flights', 'Can view flight information'),
  ('MANAGE_RESERVATIONS', 'Manage Reservations', 'Can create and modify reservations'),
  ('PROCESS_PAYMENTS', 'Process Payments', 'Can process payment transactions');

-- user_account
INSERT INTO seguridad.user_account (person_id, user_status_id, username, password_hash) VALUES
  ((SELECT person_id FROM identidad.person WHERE last_name='Perez'), (SELECT user_status_id FROM seguridad.user_status WHERE status_code='ACTIVE'), 'juan.perez', 'hash1'),
  ((SELECT person_id FROM identidad.person WHERE last_name='Garcia'), (SELECT user_status_id FROM seguridad.user_status WHERE status_code='ACTIVE'), 'maria.garcia', 'hash2'),
  ((SELECT person_id FROM identidad.person WHERE last_name='Lopez'), (SELECT user_status_id FROM seguridad.user_status WHERE status_code='SUSPENDED'), 'carlos.lopez', 'hash3');

-- user_role
INSERT INTO seguridad.user_role (user_account_id, security_role_id, assigned_at, assigned_by_user_id) VALUES
  ((SELECT user_account_id FROM seguridad.user_account WHERE username='juan.perez'), (SELECT security_role_id FROM seguridad.security_role WHERE role_code='ADMIN'), now(), NULL),
  ((SELECT user_account_id FROM seguridad.user_account WHERE username='maria.garcia'), (SELECT security_role_id FROM seguridad.security_role WHERE role_code='AGENT'), now(), (SELECT user_account_id FROM seguridad.user_account WHERE username='juan.perez')),
  ((SELECT user_account_id FROM seguridad.user_account WHERE username='carlos.lopez'), (SELECT security_role_id FROM seguridad.security_role WHERE role_code='ANALYST'), now(), (SELECT user_account_id FROM seguridad.user_account WHERE username='juan.perez'));

-- role_permission
INSERT INTO seguridad.role_permission (security_role_id, security_permission_id, granted_at) VALUES
  ((SELECT security_role_id FROM seguridad.security_role WHERE role_code='ADMIN'), (SELECT security_permission_id FROM seguridad.security_permission WHERE permission_code='VIEW_FLIGHTS'), now()),
  ((SELECT security_role_id FROM seguridad.security_role WHERE role_code='ADMIN'), (SELECT security_permission_id FROM seguridad.security_permission WHERE permission_code='MANAGE_RESERVATIONS'), now()),
  ((SELECT security_role_id FROM seguridad.security_role WHERE role_code='ANALYST'), (SELECT security_permission_id FROM seguridad.security_permission WHERE permission_code='VIEW_FLIGHTS'), now());
