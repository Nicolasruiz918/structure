## ADR-002: Roles y seguridad a nivel de fila

### Titulo

Implementacion de seguridad por roles, grants por schema y Row Level Security en tablas criticas.

### Contexto

El modelo incluye objetos sensibles en ventas, clientes, facturacion, usuarios y notificaciones. El control por grants de tabla no es suficiente para restringir acceso a filas propias.

### Decision

La seguridad queda dividida en tres niveles:

1. Roles de aplicacion en `03_dcl/00_roles`
2. Permisos por schema en `03_dcl/01_grants`
3. Politicas RLS en `03_dcl/02_policies`

### Implementacion vigente

Roles:

- `rol_admin`
- `rol_ventas`
- `rol_cliente`
- `rol_notificaciones`
- `rol_finanzas`
- `rol_mantenimiento`
- `rol_operaciones`

Tablas con RLS habilitado:

- `notificaciones.notification`
- `ventas.reservation`
- `clientes.customer`
- `facturacion.invoice`
- `seguridad.user_account`

Politicas actuales:

- 3 para notificaciones
- 3 para reservas
- 3 para clientes
- 3 para facturas
- 2 para usuarios

Total: 14 politicas.

Variables de contexto usadas por RLS:

- `app.current_customer_id`
- `app.current_office_id`
- `app.current_user_id`

### Justificacion

- defensa en profundidad
- aislamiento por rol y contexto funcional
- menor dependencia de controles solo en la aplicacion
- trazabilidad y control mas fino en datos sensibles

### Estado de implementacion

Implementado y alineado con `03_dcl`.
