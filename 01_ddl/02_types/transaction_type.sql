CREATE TYPE transaction_type AS ENUM ('AUTH', 'CAPTURE', 'VOID', 'REFUND', 'REVERSAL');
COMMENT ON TYPE transaction_type IS 'Tipo de transacción financiera';
