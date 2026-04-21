-- Insert de datos de prueba para el dominio IDENTIDAD
-- Depende de geografía

-- person_type
INSERT INTO identidad.person_type (type_code, type_name) VALUES
  ('TP001', 'Natural Person'),
  ('TP002', 'Legal Entity'),
  ('TP003', 'Passenger'),
  ('TP004', 'Employee'),
  ('TP005', 'Supplier');

-- document_type
INSERT INTO identidad.document_type (type_code, type_name) VALUES
  ('CC', 'Cedula Ciudadania'),
  ('CE', 'Cedula Extranjeria'),
  ('PA', 'Pasaporte'),
  ('TI', 'Tarjeta de Identidad'),
  ('PX', 'Permiso Especial');

-- contact_type
INSERT INTO identidad.contact_type (type_code, type_name) VALUES
  ('EMAIL', 'Email'),
  ('PHONE', 'Phone'),
  ('MOBILE', 'Mobile'),
  ('WHATSAPP', 'WhatsApp'),
  ('FAX', 'Fax');

-- person
INSERT INTO identidad.person (person_type_id, nationality_country_id, first_name, last_name, birth_date, gender_code) VALUES
  ((SELECT person_type_id FROM identidad.person_type WHERE type_code='TP003'), (SELECT country_id FROM geografia.country WHERE iso_alpha2='CO'), 'Juan', 'Perez', '1985-05-14', 'M'),
  ((SELECT person_type_id FROM identidad.person_type WHERE type_code='TP003'), (SELECT country_id FROM geografia.country WHERE iso_alpha2='CO'), 'Maria', 'Garcia', '1990-10-28', 'F'),
  ((SELECT person_type_id FROM identidad.person_type WHERE type_code='TP004'), (SELECT country_id FROM geografia.country WHERE iso_alpha2='MX'), 'Carlos', 'Lopez', '1982-03-22', 'M'),
  ((SELECT person_type_id FROM identidad.person_type WHERE type_code='TP003'), (SELECT country_id FROM geografia.country WHERE iso_alpha2='US'), 'Ana', 'Martinez', '1995-07-09', 'F'),
  ((SELECT person_type_id FROM identidad.person_type WHERE type_code='TP003'), (SELECT country_id FROM geografia.country WHERE iso_alpha2='ES'), 'Luis', 'Rodriguez', '1988-12-03', 'M');

-- person_document
INSERT INTO identidad.person_document (person_id, document_type_id, issuing_country_id, document_number, issued_on, expires_on) VALUES
  ((SELECT person_id FROM identidad.person WHERE last_name='Perez'), (SELECT document_type_id FROM identidad.document_type WHERE type_code='CC'), (SELECT country_id FROM geografia.country WHERE iso_alpha2='CO'), '1023456789', '2010-05-01', '2030-05-01'),
  ((SELECT person_id FROM identidad.person WHERE last_name='Garcia'), (SELECT document_type_id FROM identidad.document_type WHERE type_code='CC'), (SELECT country_id FROM geografia.country WHERE iso_alpha2='CO'), '1023456790', '2012-08-15', '2032-08-15'),
  ((SELECT person_id FROM identidad.person WHERE last_name='Lopez'), (SELECT document_type_id FROM identidad.document_type WHERE type_code='PA'), (SELECT country_id FROM geografia.country WHERE iso_alpha2='MX'), 'PA123456', '2018-01-12', '2028-01-12'),
  ((SELECT person_id FROM identidad.person WHERE last_name='Martinez'), (SELECT document_type_id FROM identidad.document_type WHERE type_code='PA'), (SELECT country_id FROM geografia.country WHERE iso_alpha2='US'), 'PA654321', '2019-07-20', '2029-07-20'),
  ((SELECT person_id FROM identidad.person WHERE last_name='Rodriguez'), (SELECT document_type_id FROM identidad.document_type WHERE type_code='PA'), (SELECT country_id FROM geografia.country WHERE iso_alpha2='ES'), 'PA789012', '2020-11-05', '2030-11-05');

-- person_contact
INSERT INTO identidad.person_contact (person_id, contact_type_id, contact_value, is_primary) VALUES
  ((SELECT person_id FROM identidad.person WHERE last_name='Perez'), (SELECT contact_type_id FROM identidad.contact_type WHERE type_code='EMAIL'), 'juan.perez@email.com', true),
  ((SELECT person_id FROM identidad.person WHERE last_name='Garcia'), (SELECT contact_type_id FROM identidad.contact_type WHERE type_code='PHONE'), '+57 301 1234567', true),
  ((SELECT person_id FROM identidad.person WHERE last_name='Lopez'), (SELECT contact_type_id FROM identidad.contact_type WHERE type_code='EMAIL'), 'carlos.lopez@email.com', true),
  ((SELECT person_id FROM identidad.person WHERE last_name='Martinez'), (SELECT contact_type_id FROM identidad.contact_type WHERE type_code='MOBILE'), '+1 212 5550100', true),
  ((SELECT person_id FROM identidad.person WHERE last_name='Rodriguez'), (SELECT contact_type_id FROM identidad.contact_type WHERE type_code='EMAIL'), 'luis.rodriguez@email.com', true);
