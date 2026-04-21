-- ============================================
-- ROLLBACK: Eliminar políticas de CLIENTES
-- ============================================

DROP POLICY IF EXISTS customer_admin_policy ON clientes.customer;
DROP POLICY IF EXISTS customer_ventas_policy ON clientes.customer;
DROP POLICY IF EXISTS customer_cliente_policy ON clientes.customer;

RAISE NOTICE '✓ Políticas de clientes eliminadas';