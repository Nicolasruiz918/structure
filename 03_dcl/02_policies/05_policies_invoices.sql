-- =====================================================
-- Políticas RLS para FACTURAS
-- =====================================================

-- rol_admin: acceso total
CREATE POLICY invoice_admin_policy ON facturacion.invoice
    FOR ALL
    TO rol_admin
    USING (true)
    WITH CHECK (true);

-- rol_finanzas: puede ver y gestionar todas las facturas
CREATE POLICY invoice_finanzas_policy ON facturacion.invoice
    FOR SELECT
    TO rol_finanzas
    USING (true);

-- rol_cliente solo ve SUS facturas
CREATE POLICY invoice_cliente_policy ON facturacion.invoice
    FOR SELECT
    TO rol_cliente
    USING (
        customer_id = current_setting('app.current_customer_id', true)::int
    );