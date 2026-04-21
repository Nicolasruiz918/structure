-- =====================================================
-- Políticas RLS para USUARIOS
-- =====================================================

-- rol_admin: acceso total
CREATE POLICY user_admin_policy ON seguridad.user_account
    FOR ALL
    TO rol_admin
    USING (true)
    WITH CHECK (true);

-- cada rol solo ve SU PROPIA cuenta
CREATE POLICY user_self_policy ON seguridad.user_account
    FOR SELECT
    TO rol_ventas, rol_cliente, rol_notificaciones, rol_finanzas, rol_mantenimiento, rol_operaciones
    USING (
        user_id = current_setting('app.current_user_id', true)::int
    );