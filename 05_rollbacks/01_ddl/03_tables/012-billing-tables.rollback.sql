-- Rollback for 012_create_billing_tables.sql

DROP INDEX IF EXISTS facturacion.facturacion.idx_invoice_line_invoice_id CASCADE;
DROP INDEX IF EXISTS facturacion.facturacion.idx_invoice_status_id CASCADE;
DROP INDEX IF EXISTS facturacion.facturacion.idx_invoice_sale_id CASCADE;
DROP INDEX IF EXISTS facturacion.facturacion.idx_exchange_rate_from_to_date CASCADE;

DROP TABLE IF EXISTS facturacion.facturacion.invoice_line CASCADE;
DROP TABLE IF EXISTS facturacion.facturacion.invoice CASCADE;
DROP TABLE IF EXISTS facturacion.facturacion.invoice_status CASCADE;
DROP TABLE IF EXISTS facturacion.facturacion.exchange_rate CASCADE;
DROP TABLE IF EXISTS facturacion.facturacion.tax CASCADE;


