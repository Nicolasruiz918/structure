-- ============================================
-- ABORDAJE - Índices
-- ============================================

CREATE INDEX idx_check_in_status_id ON abordaje.check_in(check_in_status_id);
CREATE INDEX idx_boarding_pass_check_in_id ON abordaje.boarding_pass(check_in_id);
CREATE INDEX idx_boarding_validation_boarding_pass_id ON abordaje.boarding_validation(boarding_pass_id);
