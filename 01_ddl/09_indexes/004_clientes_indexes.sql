-- ============================================
-- CLIENTES - Índices
-- ============================================

CREATE INDEX idx_customer_person_id ON clientes.customer(person_id);
CREATE INDEX idx_loyalty_program_airline_id ON clientes.loyalty_program(airline_id);
CREATE INDEX idx_loyalty_account_customer_id ON clientes.loyalty_account(customer_id);
CREATE INDEX idx_loyalty_account_tier_account_id ON clientes.loyalty_account_tier(loyalty_account_id);
CREATE INDEX idx_miles_transaction_account_id ON clientes.miles_transaction(loyalty_account_id);
