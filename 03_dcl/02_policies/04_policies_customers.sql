-- =====================================================
-- Políticas RLS para CLIENTES
-- =====================================================

-- rol_admin: acceso total
CREATE POLICY customer_admin_policy ON clientes.customer
    FOR ALL
    TO rol_admin
    USING (true)
    WITH CHECK (true);

-- rol_ventas: puede ver todos los clientes (para búsquedas/ventas)
CREATE POLICY customer_ventas_policy ON clientes.customer
    FOR SELECT
    TO rol_ventas
    USING (true);

-- rol_cliente solo ve SUS propios datos
CREATE POLICY customer_cliente_policy ON clientes.customer
    FOR SELECT
    TO rol_cliente
    USING (
        customer_id = current_setting('app.current_customer_id', true)::int
    );