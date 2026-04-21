-- ============================================
-- AEROPUERTO - Índices
-- ============================================

CREATE INDEX idx_airport_address_id ON aeropuerto.airport(address_id);
CREATE INDEX idx_terminal_airport_id ON aeropuerto.terminal(airport_id);
CREATE INDEX idx_boarding_gate_terminal_id ON aeropuerto.boarding_gate(terminal_id);
CREATE INDEX idx_runway_airport_id ON aeropuerto.runway(airport_id);
