-- ============================================
-- ROLLBACK: Eliminar políticas de FACTURAS
-- ============================================

DROP POLICY IF EXISTS invoice_admin_policy ON facturacion.invoice;
DROP POLICY IF EXISTS invoice_finanzas_policy ON facturacion.invoice;
DROP POLICY IF EXISTS invoice_cliente_policy ON facturacion.invoice;

RAISE NOTICE '✓ Políticas de facturas eliminadas';