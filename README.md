# Base de datos - Sistema de Aerolinea

Repositorio de estructura y datos base para PostgreSQL, versionado con Liquibase y preparado para ejecucion local con Docker Compose.

## Estado actual

- Motor objetivo: PostgreSQL 15
- Orquestacion local: `docker-compose.yaml`
- Versionado de BD: Liquibase 4.25
- Changelog maestro: `changelog/changelog-master.yaml`
- Modulos cargados por el master:
  - `01_ddl`
  - `02_dml`
  - `03_dcl`

## Cobertura funcional actual

El proyecto modela 13 dominios funcionales mediante schemas independientes:

1. `geografia`
2. `aerolinea`
3. `identidad`
4. `seguridad`
5. `clientes`
6. `aeropuerto`
7. `aeronaves`
8. `operaciones`
9. `ventas`
10. `abordaje`
11. `pagos`
12. `facturacion`
13. `notificaciones`

Resumen verificable desde los SQL actuales:

- 13 schemas de negocio
- 80 tablas base en `01_ddl/03_tables`
- 69 indices en `01_ddl/09_indexes`
- 13 scripts de carga base en `02_dml/00_inserts`
- 7 roles en `03_dcl/00_roles`
- 5 tablas con RLS habilitado
- 14 politicas RLS
- 52 changesets cargados por el changelog maestro

## Estructura del repositorio

```text
01_ddl/
  00_extensions/
  01_schemas/
  02_types/
  03_tables/
  04_views/
  05_materialized_views/
  06_functions/
  07_procedures/
  08_triggers/
  09_indexes/
  10_configuration/
02_dml/
  00_inserts/
03_dcl/
  00_roles/
  01_grants/
  02_policies/
05_rollbacks/
changelog/
docs/
scripts/
```

Notas:

- `04_views` a `08_triggers` existen como modulos preparados, pero hoy no contienen objetos implementados.
- `05_rollbacks` contiene rollbacks para DDL base, DML y DCL. El modulo `10_configuration` no tiene rollback definido.

## Ejecucion rapida

Levantar el entorno:

```bash
docker-compose up -d
```

Ver logs de Liquibase:

```bash
docker-compose logs liquibase
```

Conectarse a PostgreSQL:

```bash
docker exec -it aerolinea_postgres psql -U admin -d aerolinea
```

## Configuracion de conexion

- Host: `localhost`
- Puerto: `25432`
- Base de datos: `aerolinea`
- Usuario: `admin`
- Password: `admin123`

`liquibase.properties` actual:

```properties
changeLogFile=changelog/changelog-master.yaml
url=jdbc:postgresql://postgres:5432/aerolinea
username=admin
password=admin123
driver=org.postgresql.Driver
logLevel=INFO
```

## Verificaciones sugeridas

En `psql`, despues de ejecutar las migraciones:

```sql
SELECT COUNT(*) FROM information_schema.schemata
WHERE schema_name IN (
  'geografia','aerolinea','identidad','seguridad','clientes',
  'aeropuerto','aeronaves','operaciones','ventas','abordaje',
  'pagos','facturacion','notificaciones'
);

SELECT COUNT(*) FROM public.databasechangelog;

SELECT schemaname, tablename
FROM pg_tables
WHERE schemaname IN (
  'geografia','aerolinea','identidad','seguridad','clientes',
  'aeropuerto','aeronaves','operaciones','ventas','abordaje',
  'pagos','facturacion','notificaciones'
)
ORDER BY schemaname, tablename;

SELECT schemaname, tablename, policyname
FROM pg_policies
ORDER BY schemaname, tablename, policyname;
```

## Documentacion

La carpeta `docs/` ya fue ajustada para reflejar el estado real del repositorio al 2026-04-20. Si se modifica la estructura de changelogs o seguridad, estos documentos deben actualizarse en el mismo cambio.
