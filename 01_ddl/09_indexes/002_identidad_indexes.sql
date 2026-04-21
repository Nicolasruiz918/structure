-- ============================================
-- IDENTIDAD - Índices
-- ============================================

CREATE INDEX idx_person_person_type_id ON identidad.person(person_type_id);
CREATE INDEX idx_person_nationality_country_id ON identidad.person(nationality_country_id);
CREATE INDEX idx_person_document_person_id ON identidad.person_document(person_id);
CREATE INDEX idx_person_document_number ON identidad.person_document(document_number);
CREATE INDEX idx_person_contact_person_id ON identidad.person_contact(person_id);
CREATE INDEX idx_person_contact_value ON identidad.person_contact(contact_value);
