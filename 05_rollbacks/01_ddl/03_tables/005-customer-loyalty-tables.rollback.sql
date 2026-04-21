-- Rollback for 005_create_customer_loyalty_tables.sql

DROP INDEX IF EXISTS clientes.clientes.idx_miles_transaction_account_id CASCADE;
DROP INDEX IF EXISTS clientes.clientes.idx_loyalty_account_tier_account_id CASCADE;
DROP INDEX IF EXISTS clientes.clientes.idx_loyalty_account_customer_id CASCADE;
DROP INDEX IF EXISTS clientes.clientes.idx_loyalty_program_airline_id CASCADE;
DROP INDEX IF EXISTS clientes.clientes.idx_customer_person_id CASCADE;

DROP TABLE IF EXISTS clientes.clientes.customer_benefit CASCADE;
DROP TABLE IF EXISTS clientes.clientes.miles_transaction CASCADE;
DROP TABLE IF EXISTS clientes.clientes.loyalty_account_tier CASCADE;
DROP TABLE IF EXISTS clientes.clientes.loyalty_account CASCADE;
DROP TABLE IF EXISTS clientes.clientes.customer CASCADE;
DROP TABLE IF EXISTS clientes.clientes.loyalty_tier CASCADE;
DROP TABLE IF EXISTS clientes.clientes.loyalty_program CASCADE;
DROP TABLE IF EXISTS clientes.clientes.benefit_type CASCADE;
DROP TABLE IF EXISTS clientes.clientes.customer_category CASCADE;


