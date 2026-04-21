-- ============================================
-- Habilitar RLS en Tablas Críticas
-- ============================================

ALTER TABLE notificaciones.notification   ENABLE ROW LEVEL SECURITY;
ALTER TABLE ventas.reservation             ENABLE ROW LEVEL SECURITY;
ALTER TABLE clientes.customer             ENABLE ROW LEVEL SECURITY;
ALTER TABLE facturacion.invoice            ENABLE ROW LEVEL SECURITY;
ALTER TABLE seguridad.user_account         ENABLE ROW LEVEL SECURITY;

-- =====================================================
-- FORCE ROW LEVEL SECURITY
-- Sin esto, el owner de la tabla ignora las políticas.
-- =====================================================

ALTER TABLE notificaciones.notification   FORCE ROW LEVEL SECURITY;
ALTER TABLE ventas.reservation             FORCE ROW LEVEL SECURITY;
ALTER TABLE clientes.customer             FORCE ROW LEVEL SECURITY;
ALTER TABLE facturacion.invoice            FORCE ROW LEVEL SECURITY;
ALTER TABLE seguridad.user_account         FORCE ROW LEVEL SECURITY;