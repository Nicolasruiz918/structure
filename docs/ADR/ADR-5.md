## ADR-005: Entorno local reproducible con Docker Compose

### Titulo

Contenerizacion de PostgreSQL y Liquibase para ejecucion local consistente.

### Decision

Se adopta `docker-compose.yaml` como mecanismo principal para levantar el entorno de base de datos y aplicar migraciones.

### Implementacion vigente

Servicios:

- `postgres`
- `liquibase`

Imagenes:

- `postgres:15`
- `liquibase/liquibase:4.25`

Montajes actuales del servicio `liquibase`:

- `./changelog:/liquibase/changelog`
- `./01_ddl:/liquibase/01_ddl`
- `./02_dml:/liquibase/02_dml`
- `./03_dcl:/liquibase/03_dcl`
- `./05_rollbacks:/liquibase/05_rollbacks`
- `./liquibase.properties:/liquibase/liquibase.properties`

Conexion local expuesta:

- host: `localhost`
- puerto: `25432`
- base: `aerolinea`
- usuario: `admin`

### Comandos de uso diario

```bash
docker-compose up -d
docker-compose logs liquibase
docker-compose ps
docker-compose run --rm liquibase rollbackCount 1
docker-compose down
docker-compose down -v
```

### Estado

Implementado y alineado con el archivo `docker-compose.yaml`.
