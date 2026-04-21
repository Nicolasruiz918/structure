-- ============================================
-- SEGURIDAD - Índices
-- ============================================

CREATE INDEX idx_user_account_status_id ON seguridad.user_account(user_status_id);
CREATE INDEX idx_user_role_user_account_id ON seguridad.user_role(user_account_id);
CREATE INDEX idx_user_role_role_id ON seguridad.user_role(security_role_id);
CREATE INDEX idx_role_permission_role_id ON seguridad.role_permission(security_role_id);
CREATE INDEX idx_role_permission_permission_id ON seguridad.role_permission(security_permission_id);
