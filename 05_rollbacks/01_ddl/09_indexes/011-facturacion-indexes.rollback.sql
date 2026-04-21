-- ============================================
-- FACTURACION - Rollback Índices
-- ============================================

DROP INDEX IF EXISTS facturacion.idx_exchange_rate_from_to_date;
DROP INDEX IF EXISTS facturacion.idx_invoice_sale_id;
DROP INDEX IF EXISTS facturacion.idx_invoice_status_id;
DROP INDEX IF EXISTS facturacion.idx_invoice_line_invoice_id;
