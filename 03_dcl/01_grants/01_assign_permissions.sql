-- =====================================================
-- Asignación de Permisos por Rol
-- =====================================================

-- rol_admin: permisos completos
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA notificaciones TO rol_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA ventas         TO rol_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA clientes       TO rol_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA facturacion    TO rol_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA seguridad      TO rol_admin;

-- rol_notificaciones: gestión de notificaciones
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA notificaciones TO rol_notificaciones;
GRANT SELECT                  ON ALL TABLES IN SCHEMA identidad      TO rol_notificaciones;
GRANT SELECT                  ON ALL TABLES IN SCHEMA clientes       TO rol_notificaciones;

-- rol_ventas: gestión de reservas y ventas
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA ventas      TO rol_ventas;
GRANT SELECT                  ON ALL TABLES IN SCHEMA clientes    TO rol_ventas;
GRANT SELECT                  ON ALL TABLES IN SCHEMA aeronaves   TO rol_ventas;
GRANT SELECT                  ON ALL TABLES IN SCHEMA operaciones TO rol_ventas;
GRANT SELECT                  ON ALL TABLES IN SCHEMA geografia   TO rol_ventas;
GRANT SELECT                  ON ALL TABLES IN SCHEMA aeropuerto  TO rol_ventas;

-- rol_cliente: acceso limitado a datos personales
GRANT SELECT ON ALL TABLES IN SCHEMA ventas         TO rol_cliente;
GRANT SELECT ON ALL TABLES IN SCHEMA clientes       TO rol_cliente;
GRANT SELECT ON ALL TABLES IN SCHEMA notificaciones TO rol_cliente;
GRANT SELECT ON ALL TABLES IN SCHEMA facturacion    TO rol_cliente;

-- rol_finanzas: acceso a facturación y pagos
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA facturacion TO rol_finanzas;
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA pagos       TO rol_finanzas;
GRANT SELECT                  ON ALL TABLES IN SCHEMA ventas     TO rol_finanzas;

-- rol_mantenimiento: acceso a aeronaves
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA aeronaves   TO rol_mantenimiento;
GRANT SELECT                  ON ALL TABLES IN SCHEMA operaciones TO rol_mantenimiento;

-- rol_operaciones: gestión de vuelos
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA operaciones TO rol_operaciones;
GRANT SELECT                  ON ALL TABLES IN SCHEMA aeronaves  TO rol_operaciones;
GRANT SELECT                  ON ALL TABLES IN SCHEMA aeropuerto TO rol_operaciones;
GRANT SELECT                  ON ALL TABLES IN SCHEMA abordaje   TO rol_operaciones;