-- Insert de datos de prueba para el dominio PAGOS
-- Depende de ventas y geografía

-- payment_status
INSERT INTO pagos.payment_status (status_code, status_name) VALUES
  ('PAID', 'Paid'),
  ('PENDING', 'Pending'),
  ('FAILED', 'Failed');

-- payment_method
INSERT INTO pagos.payment_method (method_code, method_name) VALUES
  ('CREDIT', 'Credit Card'),
  ('DEBIT', 'Debit Card'),
  ('PAYPAL', 'PayPal');

-- payment
INSERT INTO pagos.payment (sale_id, payment_status_id, payment_method_id, currency_id, payment_reference, amount, authorized_at) VALUES
  ((SELECT sale_id FROM ventas.sale WHERE sale_code='SALE-1001'), (SELECT payment_status_id FROM pagos.payment_status WHERE status_code='PAID'), (SELECT payment_method_id FROM pagos.payment_method WHERE method_code='CREDIT'), (SELECT currency_id FROM geografia.currency WHERE iso_currency_code='COP'), 'PAY-1001', 850000, now()),
  ((SELECT sale_id FROM ventas.sale WHERE sale_code='SALE-1002'), (SELECT payment_status_id FROM pagos.payment_status WHERE status_code='PAID'), (SELECT payment_method_id FROM pagos.payment_method WHERE method_code='DEBIT'), (SELECT currency_id FROM geografia.currency WHERE iso_currency_code='USD'), 'PAY-1002', 1200.00, now());

-- payment_transaction
INSERT INTO pagos.payment_transaction (payment_id, transaction_reference, transaction_type, transaction_amount, processed_at, provider_message) VALUES
  ((SELECT payment_id FROM pagos.payment WHERE payment_reference='PAY-1001'), 'TXN-1001', 'CAPTURE', 850000, now(), 'Approved'),
  ((SELECT payment_id FROM pagos.payment WHERE payment_reference='PAY-1002'), 'TXN-1002', 'CAPTURE', 1200.00, now(), 'Approved');

-- refund
INSERT INTO pagos.refund (payment_id, refund_reference, amount, requested_at, processed_at, refund_reason) VALUES
  ((SELECT payment_id FROM pagos.payment WHERE payment_reference='PAY-1002'), 'REF-1002', 100.00, now(), now(), 'Customer service credit');
