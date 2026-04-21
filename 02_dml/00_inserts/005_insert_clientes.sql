-- Insert de datos de prueba para el dominio CLIENTES
-- Depende de identidad y aerolínea

-- customer_category
INSERT INTO clientes.customer_category (category_code, category_name) VALUES
  ('STANDARD', 'Standard'),
  ('PREMIUM', 'Premium'),
  ('VIP', 'VIP');

-- benefit_type
INSERT INTO clientes.benefit_type (benefit_code, benefit_name, benefit_description) VALUES
  ('LOUNGE', 'Lounge Access', 'Access to premium lounges'),
  ('PRIORITY', 'Priority Boarding', 'Priority boarding service'),
  ('BAGGAGE', 'Extra Baggage', 'Extra baggage allowance');

-- loyalty_program
INSERT INTO clientes.loyalty_program (airline_id, default_currency_id, program_code, program_name, expiration_months) VALUES
  ((SELECT airline_id FROM aerolinea.airline WHERE airline_code='ALCO'), (SELECT currency_id FROM geografia.currency WHERE iso_currency_code='COP'), 'CONFY', 'Conexión Fly', 24),
  ((SELECT airline_id FROM aerolinea.airline WHERE airline_code='ALUS'), (SELECT currency_id FROM geografia.currency WHERE iso_currency_code='USD'), 'UNITRAVEL', 'United Travel', 24);

-- loyalty_tier
INSERT INTO clientes.loyalty_tier (loyalty_program_id, tier_code, tier_name, priority_level, required_miles) VALUES
  ((SELECT loyalty_program_id FROM clientes.loyalty_program WHERE program_code='CONFY'), 'BRONZE', 'Bronze', 1, 0),
  ((SELECT loyalty_program_id FROM clientes.loyalty_program WHERE program_code='CONFY'), 'SILVER', 'Silver', 2, 25000),
  ((SELECT loyalty_program_id FROM clientes.loyalty_program WHERE program_code='UNITRAVEL'), 'GOLD', 'Gold', 2, 30000);

-- customer
INSERT INTO clientes.customer (airline_id, person_id, customer_category_id, customer_since) VALUES
  ((SELECT airline_id FROM aerolinea.airline WHERE airline_code='ALCO'), (SELECT person_id FROM identidad.person WHERE last_name='Perez'), (SELECT customer_category_id FROM clientes.customer_category WHERE category_code='PREMIUM'), '2020-01-15'),
  ((SELECT airline_id FROM aerolinea.airline WHERE airline_code='ALUS'), (SELECT person_id FROM identidad.person WHERE last_name='Garcia'), (SELECT customer_category_id FROM clientes.customer_category WHERE category_code='STANDARD'), '2021-06-10'),
  ((SELECT airline_id FROM aerolinea.airline WHERE airline_code='ALMX'), (SELECT person_id FROM identidad.person WHERE last_name='Lopez'), (SELECT customer_category_id FROM clientes.customer_category WHERE category_code='VIP'), '2019-11-20');

-- loyalty_account
INSERT INTO clientes.loyalty_account (customer_id, loyalty_program_id, account_number) VALUES
  ((SELECT customer_id FROM clientes.customer WHERE customer_category_id = (SELECT customer_category_id FROM clientes.customer_category WHERE category_code='PREMIUM')), (SELECT loyalty_program_id FROM clientes.loyalty_program WHERE program_code='CONFY'), 'ACC-1001'),
  ((SELECT customer_id FROM clientes.customer WHERE customer_category_id = (SELECT customer_category_id FROM clientes.customer_category WHERE category_code='STANDARD')), (SELECT loyalty_program_id FROM clientes.loyalty_program WHERE program_code='UNITRAVEL'), 'ACC-1002');

-- loyalty_account_tier
INSERT INTO clientes.loyalty_account_tier (loyalty_account_id, loyalty_tier_id, assigned_at, expires_at) VALUES
  ((SELECT loyalty_account_id FROM clientes.loyalty_account WHERE account_number='ACC-1001'), (SELECT loyalty_tier_id FROM clientes.loyalty_tier WHERE tier_code='SILVER'), now(), now() + interval '1 year'),
  ((SELECT loyalty_account_id FROM clientes.loyalty_account WHERE account_number='ACC-1002'), (SELECT loyalty_tier_id FROM clientes.loyalty_tier WHERE tier_code='GOLD'), now(), now() + interval '1 year');

-- miles_transaction
INSERT INTO clientes.miles_transaction (loyalty_account_id, transaction_type, miles_delta, occurred_at, reference_code, notes) VALUES
  ((SELECT loyalty_account_id FROM clientes.loyalty_account WHERE account_number='ACC-1001'), 'EARN', 12000, now(), 'TX1001', 'Initial miles award'),
  ((SELECT loyalty_account_id FROM clientes.loyalty_account WHERE account_number='ACC-1002'), 'EARN', 15000, now(), 'TX1002', 'Initial miles award');

-- customer_benefit
INSERT INTO clientes.customer_benefit (customer_id, benefit_type_id, granted_at, expires_at, notes) VALUES
  ((SELECT customer_id FROM clientes.customer WHERE customer_category_id = (SELECT customer_category_id FROM clientes.customer_category WHERE category_code='PREMIUM')), (SELECT benefit_type_id FROM clientes.benefit_type WHERE benefit_code='LOUNGE'), now(), now() + interval '6 months', 'Priority lounge access'),
  ((SELECT customer_id FROM clientes.customer WHERE customer_category_id = (SELECT customer_category_id FROM clientes.customer_category WHERE category_code='VIP')), (SELECT benefit_type_id FROM clientes.benefit_type WHERE benefit_code='BAGGAGE'), now(), now() + interval '6 months', 'Free extra baggage');
