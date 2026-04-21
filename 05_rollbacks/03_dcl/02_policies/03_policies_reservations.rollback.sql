-- ============================================
-- ROLLBACK: Eliminar políticas de RESERVAS
-- ============================================

DROP POLICY IF EXISTS reservation_admin_policy ON ventas.reservation;
DROP POLICY IF EXISTS reservation_ventas_policy ON ventas.reservation;
DROP POLICY IF EXISTS reservation_cliente_policy ON ventas.reservation;

RAISE NOTICE '✓ Políticas de reservas eliminadas';