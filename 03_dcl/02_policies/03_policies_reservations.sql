-- =====================================================
-- Políticas RLS para RESERVAS Y VENTAS
-- =====================================================

-- rol_admin: acceso total
CREATE POLICY reservation_admin_policy ON ventas.reservation
    FOR ALL
    TO rol_admin
    USING (true)
    WITH CHECK (true);

-- rol_ventas restringido a su propia oficina
CREATE POLICY reservation_ventas_policy ON ventas.reservation
    FOR ALL
    TO rol_ventas
    USING (
        office_id = current_setting('app.current_office_id', true)::int
    )
    WITH CHECK (
        office_id = current_setting('app.current_office_id', true)::int
    );

-- rol_cliente solo ve SUS reservas
CREATE POLICY reservation_cliente_policy ON ventas.reservation
    FOR SELECT
    TO rol_cliente
    USING (
        booked_by_customer_id = current_setting('app.current_customer_id', true)::int
    );