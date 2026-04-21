## ADR-004: Estrategia de ramas

### Titulo

Lineamiento de trabajo por ramas para cambios de base de datos y documentacion.

### Decision

Se documenta una estrategia de ramas separadas para desarrollo y estabilizacion. Sin embargo, este ADR debe entenderse como lineamiento de colaboracion, no como evidencia automatica del estado del repositorio local.

### Aplicacion practica recomendada

- ramas de feature para cambios de dominio o migraciones
- PRs para revisar cambios en changelogs, SQL y docs
- sincronizar siempre documentacion y SQL en el mismo cambio

### Regla operativa para este repo

Si se modifica cualquiera de estos elementos:

- rutas de changelog
- conteos de domains, tablas o changesets
- ubicacion de DCL o RLS

entonces debe actualizarse tambien:

- `README.md`
- `docs/GUIA_EJECUCION.md`
- `docs/ADRS_IMPLEMENTATION.md`

### Estado

Documentado. No verificable desde el repositorio local sin consultar el remoto.
