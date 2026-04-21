-- ============================================
-- ROLLBACK: Revocar Permisos (versión individual)
-- ============================================

-- Revocar todos los permisos de todos los roles
DO $$
DECLARE
    r record;
BEGIN
    FOR r IN (
        SELECT schemaname, tablename 
        FROM pg_tables 
        WHERE schemaname IN ('notificaciones', 'ventas', 'clientes', 'facturacion', 
                             'seguridad', 'identidad', 'aeronaves', 'operaciones', 
                             'geografia', 'aeropuerto', 'pagos', 'abordaje')
    ) LOOP
        EXECUTE format('REVOKE ALL PRIVILEGES ON %I.%I FROM rol_admin, rol_ventas, rol_cliente, rol_notificaciones, rol_finanzas, rol_mantenimiento, rol_operaciones', 
                       r.schemaname, r.tablename);
    END LOOP;
END $$;

RAISE NOTICE '✓ Todos los permisos revocados';