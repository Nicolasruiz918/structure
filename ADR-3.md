## ADR-003: Versionamiento de base de datos con Liquibase

### Titulo

Uso de Liquibase como mecanismo central de versionamiento del esquema, datos base y seguridad.

### Decision

Se adopta una estructura modular compuesta por:

- `01_ddl`
- `02_dml`
- `03_dcl`

orquestada desde:

- `changelog/changelog-master.yaml`

### Implementacion vigente

`01_ddl` incluye:

- extensiones
- schemas
- types
- tablas
- indices
- configuracion
- modulos preparados para views, materialized views, functions, procedures y triggers

`02_dml` incluye:

- 13 cargas base, una por dominio

`03_dcl` incluye:

- roles
- grants
- politicas RLS

### Totales actuales

- 31 changesets DDL
- 13 changesets DML
- 8 changesets DCL
- 52 changesets en total

### Beneficios

- historial reproducible
- despliegue consistente
- integracion natural con Docker Compose
- rollback por modulo en la mayor parte de cambios operativos

### Observacion

Documentos anteriores de este ADR describian una estructura por subcarpetas de dominio distinta a la implementacion real. La referencia valida es la estructura actual del repositorio.
