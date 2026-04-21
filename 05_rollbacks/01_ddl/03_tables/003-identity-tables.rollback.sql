-- Rollback for 003_create_identity_tables.sql

DROP INDEX IF EXISTS identidad.identidad.idx_person_contact_value CASCADE;
DROP INDEX IF EXISTS identidad.identidad.idx_person_contact_person_id CASCADE;
DROP INDEX IF EXISTS identidad.identidad.idx_person_document_number CASCADE;
DROP INDEX IF EXISTS identidad.identidad.idx_person_document_person_id CASCADE;
DROP INDEX IF EXISTS identidad.identidad.idx_person_nationality_country_id CASCADE;
DROP INDEX IF EXISTS identidad.identidad.idx_person_person_type_id CASCADE;

DROP TABLE IF EXISTS identidad.identidad.person_contact CASCADE;
DROP TABLE IF EXISTS identidad.identidad.person_document CASCADE;
DROP TABLE IF EXISTS identidad.identidad.person CASCADE;
DROP TABLE IF EXISTS identidad.identidad.contact_type CASCADE;
DROP TABLE IF EXISTS identidad.identidad.document_type CASCADE;
DROP TABLE IF EXISTS identidad.identidad.person_type CASCADE;


