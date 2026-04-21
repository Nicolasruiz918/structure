-- Rollback for 003_insert_identidad.sql
DELETE FROM identidad.person_contact WHERE contact_value IN (
  'juan.perez@email.com',
  '+57 301 1234567',
  'carlos.lopez@email.com',
  '+1 212 5550100',
  'luis.rodriguez@email.com'
);
DELETE FROM identidad.person_document WHERE document_number IN ('1023456789', '1023456790', 'PA123456', 'PA654321', 'PA789012');
DELETE FROM identidad.person WHERE last_name IN ('Perez', 'Garcia', 'Lopez', 'Martinez', 'Rodriguez');
DELETE FROM identidad.contact_type WHERE type_code IN ('EMAIL', 'PHONE', 'MOBILE', 'WHATSAPP', 'FAX');
DELETE FROM identidad.document_type WHERE type_code IN ('CC', 'CE', 'PA', 'TI', 'PX');
DELETE FROM identidad.person_type WHERE type_code IN ('TP001', 'TP002', 'TP003', 'TP004', 'TP005');
