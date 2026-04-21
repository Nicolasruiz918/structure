-- Rollback for 005_insert_clientes.sql
DELETE FROM clientes.customer_benefit WHERE benefit_type_id IN (
  SELECT benefit_type_id FROM clientes.benefit_type WHERE benefit_code IN ('LOUNGE', 'BAGGAGE')
);
DELETE FROM clientes.miles_transaction WHERE reference_code IN ('TX1001', 'TX1002');
DELETE FROM clientes.loyalty_account_tier WHERE loyalty_account_id IN (
  SELECT loyalty_account_id FROM clientes.loyalty_account WHERE account_number IN ('ACC-1001', 'ACC-1002')
);
DELETE FROM clientes.loyalty_account WHERE account_number IN ('ACC-1001', 'ACC-1002');
DELETE FROM clientes.customer WHERE airline_id IN (
  SELECT airline_id FROM aerolinea.airline WHERE airline_code IN ('ALCO', 'ALUS', 'ALMX'))
  AND person_id IN (
    SELECT person_id FROM identidad.person WHERE last_name IN ('Perez', 'Garcia', 'Lopez')
  );
DELETE FROM clientes.loyalty_tier WHERE tier_code IN ('BRONZE', 'SILVER', 'GOLD');
DELETE FROM clientes.loyalty_program WHERE program_code IN ('CONFY', 'UNITRAVEL');
DELETE FROM clientes.benefit_type WHERE benefit_code IN ('LOUNGE', 'PRIORITY', 'BAGGAGE');
DELETE FROM clientes.customer_category WHERE category_code IN ('STANDARD', 'PREMIUM', 'VIP');
