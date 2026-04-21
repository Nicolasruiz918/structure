-- ============================================
-- IDENTIDAD - Rollback Índices
-- ============================================

DROP INDEX IF EXISTS identidad.idx_person_person_type_id;
DROP INDEX IF EXISTS identidad.idx_person_nationality_country_id;
DROP INDEX IF EXISTS identidad.idx_person_document_person_id;
DROP INDEX IF EXISTS identidad.idx_person_document_number;
DROP INDEX IF EXISTS identidad.idx_person_contact_person_id;
DROP INDEX IF EXISTS identidad.idx_person_contact_value;
