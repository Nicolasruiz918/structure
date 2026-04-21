-- =====================================================
-- Políticas RLS para NOTIFICACIONES
-- =====================================================

-- rol_admin: acceso total
CREATE POLICY notification_admin_policy ON notificaciones.notification
    FOR ALL
    TO rol_admin
    USING (true)
    WITH CHECK (true);

-- rol_notificaciones: gestión completa (servicio interno)
CREATE POLICY notification_system_policy ON notificaciones.notification
    FOR ALL
    TO rol_notificaciones
    USING (true)
    WITH CHECK (true);

-- rol_cliente solo ve SUS notificaciones
CREATE POLICY notification_cliente_policy ON notificaciones.notification
    FOR SELECT
    TO rol_cliente
    USING (
        customer_id = current_setting('app.current_customer_id', true)::int
    );