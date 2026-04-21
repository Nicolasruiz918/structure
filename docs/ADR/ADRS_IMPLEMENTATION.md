# Estado de implementacion de ADRs

Fecha de corte: 2026-04-20

## Resumen

| ADR | Tema | Estado actual | Implementacion real |
|-----|------|---------------|---------------------|
| ADR-001 | Dominio de notificaciones | Implementado | `01_ddl/03_tables/013_create_notification_tables.sql` |
| ADR-002 | Seguridad con roles y RLS | Implementado | `03_dcl/00_roles`, `03_dcl/01_grants`, `03_dcl/02_policies` |
| ADR-003 | Versionamiento con Liquibase | Implementado | `changelog/changelog-master.yaml` + modulos `01_ddl`, `02_dml`, `03_dcl` |
| ADR-004 | Estrategia de ramas | Documentado | No se valida desde el repo local |
| ADR-005 | Ejecucion reproducible con Docker Compose | Implementado | `docker-compose.yaml` + `liquibase.properties` |

## ADR-001

El dominio `notificaciones` existe como schema y hoy implementa 4 tablas:

- `notification_type`
- `notification_channel`
- `notification_template`
- `notification`

Tambien tiene:

- 1 changeset DDL de tablas
- 1 changeset DML de datos base
- 1 changeset de indices
- politicas RLS especificas en `03_dcl/02_policies/02_policies_notifications.sql`

## ADR-002

La seguridad actual se separa en tres capas:

1. Creacion de roles
2. Grants por schema
3. RLS por tabla critica

Estado verificado:

- 7 roles creados
- 5 tablas con `ENABLE ROW LEVEL SECURITY`
- 5 tablas con `FORCE ROW LEVEL SECURITY`
- 14 politicas RLS

Variables de contexto usadas por las politicas:

- `app.current_customer_id`
- `app.current_office_id`
- `app.current_user_id`

## ADR-003

Liquibase esta organizado por modulos:

- `01_ddl`: estructura
- `02_dml`: carga base
- `03_dcl`: seguridad

Totales actuales cargados por el changelog maestro:

- 31 changesets DDL
- 13 changesets DML
- 8 changesets DCL
- 52 changesets en total

Observacion:

- Los modulos `04_views` a `08_triggers` estan preparados pero sin objetos implementados en esta version.

## ADR-004

El ADR de ramas sigue siendo documental. Este repositorio local no permite confirmar:

- ramas remotas
- reglas de proteccion
- PRs
- politicas de merge

Por eso el documento asociado se mantiene como lineamiento, no como evidencia automatica.

## ADR-005

La ejecucion local reproducible si esta alineada con el repo:

- `postgres:15`
- `liquibase/liquibase:4.25`
- puerto local `25432`
- changelog montado en `/liquibase/changelog`
- modulos `01_ddl`, `02_dml`, `03_dcl`, `05_rollbacks` montados como volumenes

## Fuente de verdad recomendada

Cuando haya duda, tomar como prioridad:

1. `changelog/changelog-master.yaml`
2. `01_ddl/changelog.yaml`
3. `02_dml/changelog.yaml`
4. `03_dcl/changelog.yaml`
5. `docker-compose.yaml`
6. `liquibase.properties`
