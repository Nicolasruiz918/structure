CREATE TYPE gender_type AS ENUM ('F', 'M', 'X');
COMMENT ON TYPE gender_type IS 'Género de la persona: F=Femenino, M=Masculino, X=No binario/No especifica';
