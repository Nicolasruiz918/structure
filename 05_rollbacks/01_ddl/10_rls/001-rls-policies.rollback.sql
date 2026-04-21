-- Rollback for 001_create_rls_policies.sql

-- ============================================
-- Eliminar políticas RLS
-- ============================================

-- Eliminar políticas de notificaciones
DROP POLICY IF EXISTS notification_admin_policy ON notificaciones.notification;
DROP POLICY IF EXISTS notification_system_policy ON notificaciones.notification;
DROP POLICY IF EXISTS notification_cliente_policy ON notificaciones.notification;

-- Eliminar políticas de reservas
DROP POLICY IF EXISTS reservation_admin_policy ON ventas.reservation;
DROP POLICY IF EXISTS reservation_ventas_policy ON ventas.reservation;
DROP POLICY IF EXISTS reservation_cliente_policy ON ventas.reservation;

-- Eliminar políticas de clientes
DROP POLICY IF EXISTS customer_admin_policy ON clientes.customer;
DROP POLICY IF EXISTS customer_ventas_policy ON clientes.customer;
DROP POLICY IF EXISTS customer_cliente_policy ON clientes.customer;

-- Eliminar políticas de facturas
DROP POLICY IF EXISTS invoice_admin_policy ON facturacion.invoice;
DROP POLICY IF EXISTS invoice_finanzas_policy ON facturacion.invoice;
DROP POLICY IF EXISTS invoice_cliente_policy ON facturacion.invoice;

-- Eliminar políticas de usuarios
DROP POLICY IF EXISTS user_admin_policy ON seguridad.user_account;
DROP POLICY IF EXISTS user_self_policy ON seguridad.user_account;

-- ============================================
-- Deshabilitar RLS en tablas
-- ============================================

ALTER TABLE notificaciones.notification DISABLE ROW LEVEL SECURITY;
ALTER TABLE ventas.reservation DISABLE ROW LEVEL SECURITY;
ALTER TABLE clientes.customer DISABLE ROW LEVEL SECURITY;
ALTER TABLE facturacion.invoice DISABLE ROW LEVEL SECURITY;
ALTER TABLE seguridad.user_account DISABLE ROW LEVEL SECURITY;

-- ============================================
-- Revocar permisos de roles
-- ============================================

REVOKE ALL ON ALL TABLES IN SCHEMA notificaciones FROM rol_admin, rol_notificaciones, rol_cliente;
REVOKE ALL ON ALL TABLES IN SCHEMA ventas FROM rol_admin, rol_ventas, rol_cliente, rol_finanzas;
REVOKE ALL ON ALL TABLES IN SCHEMA clientes FROM rol_admin, rol_notificaciones, rol_ventas, rol_cliente;
REVOKE ALL ON ALL TABLES IN SCHEMA facturacion FROM rol_admin, rol_cliente, rol_finanzas;
REVOKE ALL ON ALL TABLES IN SCHEMA seguridad FROM rol_admin;
REVOKE ALL ON ALL TABLES IN SCHEMA pagos FROM rol_finanzas;
REVOKE ALL ON ALL TABLES IN SCHEMA aeronaves FROM rol_mantenimiento, rol_operaciones;
REVOKE ALL ON ALL TABLES IN SCHEMA operaciones FROM rol_operaciones, rol_mantenimiento;
REVOKE ALL ON ALL TABLES IN SCHEMA aeropuerto FROM rol_operaciones, rol_ventas;
REVOKE ALL ON ALL TABLES IN SCHEMA abordaje FROM rol_operaciones;
REVOKE ALL ON ALL TABLES IN SCHEMA geografia FROM rol_ventas;
REVOKE ALL ON ALL TABLES IN SCHEMA identidad FROM rol_notificaciones;

-- ============================================
-- Eliminar roles
-- ============================================

DROP ROLE IF EXISTS rol_operaciones;
DROP ROLE IF EXISTS rol_mantenimiento;
DROP ROLE IF EXISTS rol_finanzas;
DROP ROLE IF EXISTS rol_cliente;
DROP ROLE IF EXISTS rol_notificaciones;
DROP ROLE IF EXISTS rol_ventas;
DROP ROLE IF EXISTS rol_admin;
