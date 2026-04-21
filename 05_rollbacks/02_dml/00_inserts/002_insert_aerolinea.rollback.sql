-- Rollback for 002_insert_aerolinea.sql
DELETE FROM aerolinea.airline WHERE airline_code IN ('ALCO', 'ALMX', 'ALUS', 'ALEU', 'ALJP');
