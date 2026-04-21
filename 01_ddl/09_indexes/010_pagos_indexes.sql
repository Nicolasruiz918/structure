-- ============================================
-- PAGOS - Índices
-- ============================================

CREATE INDEX idx_payment_sale_id ON pagos.payment(sale_id);
CREATE INDEX idx_payment_status_id ON pagos.payment(payment_status_id);
CREATE INDEX idx_payment_transaction_payment_id ON pagos.payment_transaction(payment_id);
CREATE INDEX idx_refund_payment_id ON pagos.refund(payment_id);
