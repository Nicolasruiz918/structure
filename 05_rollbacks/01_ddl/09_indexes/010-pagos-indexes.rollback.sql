-- ============================================
-- PAGOS - Rollback Índices
-- ============================================

DROP INDEX IF EXISTS pagos.idx_payment_sale_id;
DROP INDEX IF EXISTS pagos.idx_payment_status_id;
DROP INDEX IF EXISTS pagos.idx_payment_transaction_payment_id;
DROP INDEX IF EXISTS pagos.idx_refund_payment_id;
