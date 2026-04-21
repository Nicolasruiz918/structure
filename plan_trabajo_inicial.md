# Plan de Trabajo Inicial

**Proyecto:** Estructura de Base de Datos - Sistema de Gestion de Aerolinea  
**Fecha de corte:** 2026-04-20  
**Estado base del repositorio:** vigente y alineado con Liquibase, Docker Compose y seguridad DCL/RLS

## 1. Objetivo

Definir el plan inicial de trabajo para organizar, ejecutar y validar la base de datos del proyecto, tomando como punto de partida la estructura actual del repositorio y sus componentes tecnicos ya implementados.

## 2. Alcance inicial

Este plan cubre:

- revision de estructura del repositorio
- validacion de changelogs y orden de ejecucion
- despliegue local con Docker Compose
- verificacion de DDL, DML y DCL
- control documental minimo
- identificacion de siguientes frentes tecnicos

No cubre en esta fase:

- implementacion de nuevas views
- materialized views
- functions, procedures o triggers
- automatizacion de pruebas CI/CD

## 3. Estado de partida

El proyecto cuenta actualmente con:

- `01_ddl` para estructura de base de datos
- `02_dml` para inserts base por dominio
- `03_dcl` para roles, grants y politicas RLS
- `05_rollbacks` para reversa de cambios principales
- `changelog/changelog-master.yaml` como punto de entrada de Liquibase
- `docker-compose.yaml` para entorno local reproducible

Resumen actual:

- 13 schemas de negocio
- 80 tablas base
- 69 indices
- 52 changesets
- 7 roles
- 14 politicas RLS
- 5 tablas con RLS habilitado

## 4. Fases de trabajo inicial

### Fase 1. Levantamiento y validacion del entorno

Objetivo:

Confirmar que el entorno local puede levantar PostgreSQL y ejecutar Liquibase sin errores.

Actividades:

- verificar Docker Desktop y puertos disponibles
- ejecutar `docker-compose up -d`
- revisar logs de Liquibase
- confirmar conexion a la base `aerolinea`

Entregables:

- entorno local operativo
- evidencia de cambios aplicados en `databasechangelog`

### Fase 2. Validacion estructural del modelo

Objetivo:

Comprobar que la estructura versionada coincide con la documentacion y con el alcance esperado del proyecto.

Actividades:

- validar existencia de los 13 schemas
- revisar tablas base por dominio
- verificar indices definidos
- revisar configuracion de `search_path`

Entregables:

- inventario validado de objetos de base de datos
- confirmacion de consistencia entre changelogs y SQL

### Fase 3. Validacion funcional minima de datos base

Objetivo:

Asegurar que los datos iniciales permiten pruebas basicas y respetan integridad referencial.

Actividades:

- ejecutar y validar inserts semilla
- revisar dependencias entre dominios
- confirmar integridad de claves foraneas
- cruzar con `docs/plan_datos_prueba.md`

Entregables:

- datos base cargados correctamente
- validacion minima de integridad referencial

### Fase 4. Validacion de seguridad

Objetivo:

Verificar que la capa DCL y RLS este correctamente aplicada sobre los objetos criticos.

Actividades:

- comprobar creacion de roles
- revisar grants por schema
- validar tablas con `ENABLE ROW LEVEL SECURITY`
- revisar politicas RLS vigentes

Entregables:

- matriz basica de seguridad validada
- confirmacion de cobertura RLS en tablas criticas

### Fase 5. Cierre documental inicial

Objetivo:

Dejar trazabilidad clara del estado del proyecto para siguientes iteraciones.

Actividades:

- mantener actualizados los documentos operativos
- registrar hallazgos tecnicos o desviaciones
- consolidar pendientes reales del backlog

Entregables:

- documentacion base alineada
- backlog inicial priorizado

## 5. Priorizacion inicial

### Prioridad alta

1. Ejecutar el entorno y validar que Liquibase aplique el changelog maestro completo
2. Verificar integridad estructural de schemas, tablas e indices
3. Confirmar roles, grants y RLS

### Prioridad media

1. Revisar calidad y cobertura de datos semilla
2. Dejar evidencias de validacion tecnica
3. Consolidar un checklist operativo reutilizable

### Prioridad baja

1. Planificar views y objetos avanzados
2. Automatizar verificaciones
3. Fortalecer troubleshooting y reportes

## 6. Riesgos iniciales

- desalineacion futura entre SQL y documentacion
- cambios nuevos sin actualizar conteos de changesets
- falta de rollback en algunos componentes puntuales como `10_configuration`
- ausencia de pruebas automatizadas de smoke

## 7. Criterios de exito

Se considera completado este plan inicial cuando:

- el entorno levanta sin errores
- Liquibase aplica los changesets esperados
- la estructura creada coincide con el modelo actual del repo
- los datos base cargan correctamente
- la seguridad DCL/RLS queda validada
- la documentacion operativa permanece sincronizada

## 8. Siguientes pasos sugeridos

1. Ejecutar pruebas de verificacion post-despliegue
2. Definir vistas operativas y de consulta
3. implementar functions, procedures y triggers segun necesidad funcional
4. automatizar validaciones tecnicas basicas
5. completar backlog tecnico de segunda iteracion

## 9. Documentos relacionados

- `docs/plan_datos_prueba.md`
- `docs/HISTORIAS_USUARIO.md`
- `docs/seguimientos.md`
- `docs/backolog_tecnico.md`
