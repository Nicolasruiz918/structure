# Seguimientos del proyecto

## Corte documental

Fecha: 2026-04-20

## Estado general

El repositorio actual esta consistente en estos puntos:

- changelog maestro cargando `01_ddl`, `02_dml` y `03_dcl`
- 13 schemas de negocio
- 80 tablas base
- 69 indices
- 52 changesets totales
- 7 roles
- 14 politicas RLS
- entorno local reproducible con Docker Compose

## Cambios estructurales ya consolidados

- El manejo de RLS pertenece a `03_dcl/02_policies`
- El dominio `notificaciones` esta integrado como schema, tablas, inserts, indices y politicas
- `01_ddl/10_configuration` configura `search_path` para la base y el usuario `admin`
- Los modulos `04_views` a `08_triggers` permanecen vacios en esta version

## Riesgos vigentes

- La documentacion puede volver a desalinearse si se agregan changesets sin actualizar conteos
- No hay verificacion automatica incluida en el repo para validar la ejecucion completa
- `10_configuration` no cuenta con rollback

## Recomendacion operativa

Cada cambio que toque alguno de estos archivos:

- `changelog/changelog-master.yaml`
- `01_ddl/changelog.yaml`
- `02_dml/changelog.yaml`
- `03_dcl/changelog.yaml`
- `docker-compose.yaml`

debe acompañarse de actualizacion en:

- `README.md`
- `docs/GUIA_EJECUCION.md`
- `docs/ADRS_IMPLEMENTATION.md`
