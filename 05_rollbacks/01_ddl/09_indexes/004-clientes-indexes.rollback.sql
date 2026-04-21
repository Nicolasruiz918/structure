-- ============================================
-- CLIENTES - Rollback Índices
-- ============================================

DROP INDEX IF EXISTS clientes.idx_customer_person_id;
DROP INDEX IF EXISTS clientes.idx_loyalty_program_airline_id;
DROP INDEX IF EXISTS clientes.idx_loyalty_account_customer_id;
DROP INDEX IF EXISTS clientes.idx_loyalty_account_tier_account_id;
DROP INDEX IF EXISTS clientes.idx_miles_transaction_account_id;
