Perfecto. Aquí tienes el documento completo de **Historias de Usuario** con las 11 HU definitivas que me diste.

---

# 📋 Historias de Usuario - Estabilización Base de Datos Aerolínea

## HU-001: Crear plan de trabajo inicial

| Campo | Valor |
|-------|-------|
| **ID** | HU-001 |
| **Nombre** | Crear plan de trabajo inicial |
| **Descripción** | Como líder técnico, quiero definir un plan de trabajo para las 5 horas de prueba supervisada, organizando las actividades por orden de ejecución para cumplir con todos los entregables dentro del tiempo establecido. |
| **Criterios de Aceptación** | 1. Documento `plan_trabajo_inicial.md` en carpeta `docs/` <br> 2. Cronograma detallado hora por hora <br> 3. Asignación de actividades a cada HU <br> 4. Tiempo total de 5 horas |
| **Prioridad** | Alta |
| **Dependencias** | - |
| **Entregable** | `docs/plan_trabajo_inicial.md` |

---

## HU-002: Realizar documento de seguimiento

| Campo | Valor |
|-------|-------|
| **ID** | HU-002 |
| **Nombre** | Realizar documento de seguimiento |
| **Descripción** | Como líder técnico, quiero llevar una bitácora de seguimiento del proyecto que registre el avance de cada HU, las tareas del backlog, las decisiones técnicas tomadas y los riesgos identificados. |
| **Criterios de Aceptación** | 1. Documento `seguimientos.md` en carpeta `docs/` <br> 2. Bitácora con fechas y horas <br> 3. Estado de cada HU (Completado/En progreso/Pendiente) <br> 4. Seguimiento de tareas del backlog <br> 5. Decisiones técnicas documentadas <br> 6. Riesgos y mitigaciones |
| **Prioridad** | Alta |
| **Dependencias** | HU-001 |
| **Entregable** | `docs/seguimientos.md` |

---

## HU-003: Identificar dominios funcionales

| Campo | Valor |
|-------|-------|
| **ID** | HU-003 |
| **Nombre** | Identificar dominios funcionales del modelo |
| **Descripción** | Como arquitecto de datos, quiero analizar el script `modelo_postgresql.sql` para identificar los 12 dominios funcionales, documentar sus entidades principales y sus relaciones, para comprender la arquitectura del modelo existente. |
| **Criterios de Aceptación** | 1. Documento `analisis_dominios.md` en carpeta `docs/` <br> 2. Identificación de 12 dominios funcionales <br> 3. Listado de entidades principales por dominio <br> 4. Diagrama de relaciones entre dominios <br> 5. Descripción de restricciones y claves |
| **Prioridad** | Alta |
| **Dependencias** | - |
| **Entregable** | `docs/analisis_dominios.md` |

---

## HU-004: Crear ADRs (Architecture Decision Records)

| Campo | Valor |
|-------|-------|
| **ID** | HU-004 |
| **Nombre** | Crear ADRs (Architecture Decision Records) |
| **Descripción** | Como arquitecto de datos, quiero documentar 5 ADR que justifiquen las decisiones técnicas clave del proyecto, incluyendo un nuevo dominio funcional, estrategia de roles y permisos, implementación de Liquibase, estrategia de ramas y contenedorización. |
| **Criterios de Aceptación** | 1. 5 archivos ADR en carpeta `docs/adr/` <br> 2. ADR-001: Nuevo dominio de notificaciones <br> 3. ADR-002: RLS y permisos diferenciados <br> 4. ADR-003: Implementación de Liquibase <br> 5. ADR-004: Ramas develop/qa/main <br> 6. ADR-005: Contenedorización <br> 7. Cada ADR con: Título, Contexto, Problema, Decisión, Justificación técnica, Consecuencias |
| **Prioridad** | Alta |
| **Dependencias** | HU-003 |
| **Entregable** | `docs/adr/ADR-001.md`, `ADR-002.md`, `ADR-003.md`, `ADR-004.md`, `ADR-005.md` |

---

## HU-005: Crear la estructura base del repositorio

| Campo | Valor |
|-------|-------|
| **ID** | HU-005 |
| **Nombre** | Crear la estructura base del repositorio |
| **Descripción** | Como desarrollador, quiero crear la estructura de carpetas del repositorio organizada por tipos de operación SQL (DDL, DML, DCL, TCL, rollbacks) y las ramas develop, qa y main para trabajar de forma ordenada y colaborativa. |
| **Criterios de Aceptación** | 1. Repositorio inicializado con Git <br> 2. Ramas `develop`, `qa`, `main` creadas <br> 3. Estructura de carpetas: `01_ddl/`, `02_dml/`, `03_dcl/`, `04_tcl/`, `05_rollbacks/`, `docker/`, `docs/`, `scripts/` <br> 4. Archivos: `.gitignore`, `README.md` <br> 5. Commit inicial realizado |
| **Prioridad** | Alta |
| **Dependencias** | - |
| **Entregable** | Repositorio estructurado en GitHub/GitLab |

---

## HU-006: Contenerizar PostgreSQL para levantar la base de datos

| Campo | Valor |
|-------|-------|
| **ID** | HU-006 |
| **Nombre** | Contenerizar PostgreSQL para levantar la base de datos |
| **Descripción** | Como desarrollador, quiero levantar PostgreSQL con Docker Compose para tener un entorno local reproducible de base de datos sin necesidad de instalaciones manuales. |
| **Criterios de Aceptación** | 1. Archivo `docker-compose.yml` con servicio PostgreSQL <br> 2. Puerto `25432` expuesto <br> 3. Variables de entorno: `POSTGRES_DB`, `POSTGRES_USER`, `POSTGRES_PASSWORD` <br> 4. Healthcheck configurado <br> 5. Comando `docker-compose up -d postgres` funciona <br> 6. Conexión exitosa desde `psql` |
| **Prioridad** | Alta |
| **Dependencias** | HU-005 |
| **Entregable** | `docker-compose.yml`, PostgreSQL funcionando |

---

## HU-007: Contenerizar Liquibase e integrarlo al proyecto

| Campo | Valor |
|-------|-------|
| **ID** | HU-007 |
| **Nombre** | Contenerizar Liquibase e integrarlo al proyecto |
| **Descripción** | Como desarrollador, quiero integrar Liquibase al proyecto con Docker Compose para ejecutar migraciones de base de datos de forma automatizada y versionada. |
| **Criterios de Aceptación** | 1. Servicio Liquibase en `docker-compose.yml` <br> 2. Dockerfile en `docker/liquibase/Dockerfile` <br> 3. Driver PostgreSQL incluido <br> 4. Archivo `liquibase.properties` configurado <br> 5. Profile `tooling` para Liquibase <br> 6. Comando `docker-compose --profile tooling run --rm liquibase update` funciona |
| **Prioridad** | Alta |
| **Dependencias** | HU-006 |
| **Entregable** | `docker/liquibase/Dockerfile`, `liquibase.properties`, Liquibase funcionando |

---

## HU-008: Implementar DDL y ADRs a la estructura base del repositorio

| Campo | Valor |
|-------|-------|
| **ID** | HU-008 |
| **Nombre** | Implementar DDL y ADRs a la estructura base del repositorio |
| **Descripción** | Como desarrollador, quiero separar el script SQL monolítico en archivos organizados por dominio funcional, con sus respectivos changelogs y rollbacks, siguiendo las decisiones documentadas en los ADR. |
| **Criterios de Aceptación** | 1. Archivos SQL por cada dominio en `01_ddl/03_tables/` <br> 2. `changelog.yaml` en cada subcarpeta de `01_ddl/` <br> 3. `changelog-master.yaml` en la raíz <br> 4. Archivos de rollback en `05_rollbacks/` <br> 5. Estructura completa para los 13 dominios <br> 6. Ejecución exitosa de `liquibase update` |
| **Prioridad** | Media |
| **Dependencias** | HU-003, HU-004, HU-005, HU-007 |
| **Entregable** | `01_ddl/` completo, `changelog-master.yaml`, rollbacks |

---

## HU-009: Implementar roles y permisos

| Campo | Valor |
|-------|-------|
| **ID** | HU-009 |
| **Nombre** | Implementar roles y permisos diferenciados |
| **Descripción** | Como administrador de seguridad, quiero implementar RLS (Row Level Security) y roles en PostgreSQL para que cada usuario acceda solo a los datos de su dominio funcional, fortaleciendo la seguridad y trazabilidad. |
| **Criterios de Aceptación** | 1. Roles creados en `03_dcl/00_roles/` <br> 2. Grants (permisos) en `03_dcl/01_grants/` <br> 3. Políticas RLS en `03_dcl/02_policies/` <br> 4. Políticas por dominio: ventas, mantenimiento, clientes, finanzas, admin <br> 5. Habilitación de RLS en tablas correspondientes |
| **Prioridad** | Media |
| **Dependencias** | HU-008 |
| **Entregable** | Archivos en `03_dcl/` |

---

## HU-010: Construir plan de datos de prueba con orden de carga por dependencias

| Campo | Valor |
|-------|-------|
| **ID** | HU-010 |
| **Nombre** | Construir plan de datos de prueba con orden de carga por dependencias |
| **Descripción** | Como tester, quiero definir un plan de datos de prueba que establezca el orden lógico de inserción respetando las dependencias entre tablas (claves foráneas) para poblar la base de datos de forma consistente. |
| **Criterios de Aceptación** | 1. Documento `plan_datos_prueba.md` en `docs/` <br> 2. Orden de inserción por fases y dependencias <br> 3. Identificación de tablas por fase (catálogos base, geografía, aerolínea, identidad, seguridad, clientes, etc.) <br> 4. Scripts organizados en `02_dml/00_inserts/` <br> 5. Validaciones post-inserción |
| **Prioridad** | Media |
| **Dependencias** | HU-008 |
| **Entregable** | `docs/plan_datos_prueba.md`, estructura en `02_dml/00_inserts/` |

---

## HU-011: Realizar los inserts de datos de prueba

| Campo | Valor |
|-------|-------|
| **ID** | HU-011 |
| **Nombre** | Realizar los inserts de datos de prueba |
| **Descripción** | Como tester, quiero ejecutar los scripts de inserción de datos de prueba en el orden definido por el plan de datos, para tener una base de datos poblada que permita validar el funcionamiento del sistema. |
| **Criterios de Aceptación** | 1. Scripts SQL de inserción en `02_dml/00_inserts/` por dominio <br> 2. Orden de ejecución respetando dependencias <br> 3. Datos de ejemplo para catálogos base (time_zone, continent, currency, notification_type, notification_channel) <br> 4. Datos de ejemplo para geografía (países, ciudades) <br> 5. Datos de ejemplo para aerolínea, identidad, seguridad, clientes <br> 6. Verificación de integridad referencial post-inserción |
| **Prioridad** | Media |
| **Dependencias** | HU-010 |
| **Entregable** | Scripts en `02_dml/00_inserts/`, datos insertados en BD |

---

## 📊 Resumen de Historias de Usuario

| HU | Nombre | Prioridad | Dependencias |
|----|--------|-----------|--------------|
| HU-001 | Crear plan de trabajo inicial | Alta | - |
| HU-002 | Realizar documento de seguimiento | Alta | HU-001 |
| HU-003 | Identificar dominios funcionales | Alta | - |
| HU-004 | Crear ADRs | Alta | HU-003 |
| HU-005 | Crear estructura base del repositorio | Alta | - |
| HU-006 | Contenerizar PostgreSQL | Alta | HU-005 |
| HU-007 | Contenerizar Liquibase | Alta | HU-006 |
| HU-008 | Implementar DDL y ADRs a la estructura | Media | HU-003, HU-004, HU-005, HU-007 |
| HU-009 | Implementar roles y permisos | Media | HU-008 |
| HU-010 | Construir plan de datos de prueba | Media | HU-008 |
| HU-011 | Realizar inserts de datos de prueba | Media | HU-010 |

---
