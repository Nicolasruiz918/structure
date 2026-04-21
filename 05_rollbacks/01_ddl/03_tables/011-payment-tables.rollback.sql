-- Rollback for 011_create_payment_tables.sql

DROP INDEX IF EXISTS pagos.pagos.idx_refund_payment_id CASCADE;
DROP INDEX IF EXISTS pagos.pagos.idx_payment_transaction_payment_id CASCADE;
DROP INDEX IF EXISTS pagos.pagos.idx_payment_status_id CASCADE;
DROP INDEX IF EXISTS pagos.pagos.idx_payment_sale_id CASCADE;

DROP TABLE IF EXISTS pagos.pagos.refund CASCADE;
DROP TABLE IF EXISTS pagos.pagos.payment_transaction CASCADE;
DROP TABLE IF EXISTS pagos.pagos.payment CASCADE;
DROP TABLE IF EXISTS pagos.pagos.payment_method CASCADE;
DROP TABLE IF EXISTS pagos.pagos.payment_status CASCADE;


