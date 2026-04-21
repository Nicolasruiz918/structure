-- Rollback for 004_create_security_tables.sql

DROP INDEX IF EXISTS seguridad.seguridad.idx_role_permission_permission_id CASCADE;
DROP INDEX IF EXISTS seguridad.seguridad.idx_role_permission_role_id CASCADE;
DROP INDEX IF EXISTS seguridad.seguridad.idx_user_role_role_id CASCADE;
DROP INDEX IF EXISTS seguridad.seguridad.idx_user_role_user_account_id CASCADE;
DROP INDEX IF EXISTS seguridad.seguridad.idx_user_account_status_id CASCADE;

DROP TABLE IF EXISTS seguridad.seguridad.role_permission CASCADE;
DROP TABLE IF EXISTS seguridad.seguridad.user_role CASCADE;
DROP TABLE IF EXISTS seguridad.seguridad.user_account CASCADE;
DROP TABLE IF EXISTS seguridad.seguridad.security_permission CASCADE;
DROP TABLE IF EXISTS seguridad.seguridad.security_role CASCADE;
DROP TABLE IF EXISTS seguridad.seguridad.user_status CASCADE;


