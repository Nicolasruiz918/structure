-- Rollback for 011_insert_pagos.sql
DELETE FROM pagos.refund WHERE refund_reference = 'REF-1002';
DELETE FROM pagos.payment_transaction WHERE transaction_reference IN ('TXN-1001', 'TXN-1002');
DELETE FROM pagos.payment WHERE payment_reference IN ('PAY-1001', 'PAY-1002');
DELETE FROM pagos.payment_method WHERE method_code IN ('CREDIT', 'DEBIT', 'PAYPAL');
DELETE FROM pagos.payment_status WHERE status_code IN ('PAID', 'PENDING', 'FAILED');
