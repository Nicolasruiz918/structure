-- Insert de datos de prueba para el dominio FACTURACIÓN
-- Depende de ventas y geografía

-- tax
INSERT INTO facturacion.tax (tax_code, tax_name, rate_percentage, effective_from) VALUES
  ('VAT', 'Value Added Tax', 19.00, '2024-01-01'),
  ('GST', 'General Sales Tax', 10.00, '2024-01-01');

-- exchange_rate
INSERT INTO facturacion.exchange_rate (from_currency_id, to_currency_id, effective_date, rate_value) VALUES
  ((SELECT currency_id FROM geografia.currency WHERE iso_currency_code='COP'), (SELECT currency_id FROM geografia.currency WHERE iso_currency_code='USD'), '2026-05-01', 0.00026),
  ((SELECT currency_id FROM geografia.currency WHERE iso_currency_code='USD'), (SELECT currency_id FROM geografia.currency WHERE iso_currency_code='EUR'), '2026-05-01', 0.92);

-- invoice_status
INSERT INTO facturacion.invoice_status (status_code, status_name) VALUES
  ('ISSUED', 'Issued'),
  ('PAID', 'Paid');

-- invoice
INSERT INTO facturacion.invoice (sale_id, invoice_status_id, currency_id, invoice_number, issued_at, due_at) VALUES
  ((SELECT sale_id FROM ventas.sale WHERE sale_code='SALE-1001'), (SELECT invoice_status_id FROM facturacion.invoice_status WHERE status_code='ISSUED'), (SELECT currency_id FROM geografia.currency WHERE iso_currency_code='COP'), 'INV-1001', now(), now() + interval '15 days'),
  ((SELECT sale_id FROM ventas.sale WHERE sale_code='SALE-1002'), (SELECT invoice_status_id FROM facturacion.invoice_status WHERE status_code='PAID'), (SELECT currency_id FROM geografia.currency WHERE iso_currency_code='USD'), 'INV-1002', now(), now() + interval '15 days');

-- invoice_line
INSERT INTO facturacion.invoice_line (invoice_id, tax_id, line_number, line_description, quantity, unit_price) VALUES
  ((SELECT invoice_id FROM facturacion.invoice WHERE invoice_number='INV-1001'), (SELECT tax_id FROM facturacion.tax WHERE tax_code='VAT'), 1, 'Fare charge', 1, 850000.00),
  ((SELECT invoice_id FROM facturacion.invoice WHERE invoice_number='INV-1002'), (SELECT tax_id FROM facturacion.tax WHERE tax_code='GST'), 1, 'Fare charge', 1, 1200.00);
