-- ============================================
-- ROLLBACK: Deshabilitar RLS y FORCE RLS
-- ============================================

-- Deshabilitar FORCE ROW LEVEL SECURITY
ALTER TABLE notificaciones.notification NO FORCE ROW LEVEL SECURITY;
ALTER TABLE ventas.reservation NO FORCE ROW LEVEL SECURITY;
ALTER TABLE clientes.customer NO FORCE ROW LEVEL SECURITY;
ALTER TABLE facturacion.invoice NO FORCE ROW LEVEL SECURITY;
ALTER TABLE seguridad.user_account NO FORCE ROW LEVEL SECURITY;

-- Deshabilitar RLS
ALTER TABLE notificaciones.notification DISABLE ROW LEVEL SECURITY;
ALTER TABLE ventas.reservation DISABLE ROW LEVEL SECURITY;
ALTER TABLE clientes.customer DISABLE ROW LEVEL SECURITY;
ALTER TABLE facturacion.invoice DISABLE ROW LEVEL SECURITY;
ALTER TABLE seguridad.user_account DISABLE ROW LEVEL SECURITY;

RAISE NOTICE '✓ RLS y FORCE RLS deshabilitados';