## ADR-001: Nuevo dominio funcional de notificaciones

### Titulo

Creacion del schema `notificaciones` para gestionar comunicaciones del sistema.

### Contexto

El modelo actual necesita registrar eventos de comunicacion hacia clientes y operaciones internas, con trazabilidad basica de plantillas, canales y estado de entrega.

### Decision

Se implementa un dominio independiente llamado `notificaciones`, materializado hoy en el archivo:

- `01_ddl/03_tables/013_create_notification_tables.sql`

La implementacion actual crea 4 tablas:

1. `notificaciones.notification_type`
2. `notificaciones.notification_channel`
3. `notificaciones.notification_template`
4. `notificaciones.notification`

Complementos actuales del dominio:

- datos base: `02_dml/00_inserts/013_insert_notificaciones.sql`
- indices: `01_ddl/09_indexes/012_notificaciones_indexes.sql`
- RLS: `03_dcl/02_policies/02_policies_notifications.sql`

### Justificacion

- separa las comunicaciones como capacidad propia del negocio
- evita mezclar logica de notificaciones dentro de ventas o facturacion
- permite control sobre tipos, canales, plantillas y estado de entrega
- habilita controles de acceso dedicados por rol

### Estado de implementacion

Implementado y alineado con el repo actual.

### Observacion

Versiones anteriores de esta documentacion hablaban de 6 tablas. El estado vigente del repositorio implementa 4.
