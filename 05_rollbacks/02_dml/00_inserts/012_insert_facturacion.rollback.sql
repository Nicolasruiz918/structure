-- Rollback for 012_insert_facturacion.sql
DELETE FROM facturacion.invoice_line WHERE invoice_id IN (
  SELECT invoice_id FROM facturacion.invoice WHERE invoice_number IN ('INV-1001', 'INV-1002')
);
DELETE FROM facturacion.invoice WHERE invoice_number IN ('INV-1001', 'INV-1002');
DELETE FROM facturacion.invoice_status WHERE status_code IN ('ISSUED', 'PAID');
DELETE FROM facturacion.exchange_rate WHERE effective_date = '2026-05-01' AND rate_value IN (0.00026, 0.92);
DELETE FROM facturacion.tax WHERE tax_code IN ('VAT', 'GST');
