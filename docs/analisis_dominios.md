# Analisis de dominios

Este documento refleja el estado actual del repositorio, no el analisis historico del modelo original.

## Dominios implementados

| # | Schema | Tablas |
|---|--------|--------|
| 1 | `geografia` | 8 |
| 2 | `aerolinea` | 1 |
| 3 | `identidad` | 6 |
| 4 | `seguridad` | 6 |
| 5 | `clientes` | 9 |
| 6 | `aeropuerto` | 5 |
| 7 | `aeronaves` | 9 |
| 8 | `operaciones` | 5 |
| 9 | `ventas` | 12 |
| 10 | `abordaje` | 5 |
| 11 | `pagos` | 5 |
| 12 | `facturacion` | 5 |
| 13 | `notificaciones` | 4 |

Total actual: 80 tablas base.

## Entidades por dominio

- `geografia`: `time_zone`, `continent`, `country`, `state_province`, `city`, `district`, `address`, `currency`
- `aerolinea`: `airline`
- `identidad`: `person_type`, `document_type`, `contact_type`, `person`, `person_document`, `person_contact`
- `seguridad`: `user_status`, `security_role`, `security_permission`, `user_account`, `user_role`, `role_permission`
- `clientes`: `customer_category`, `benefit_type`, `loyalty_program`, `loyalty_tier`, `customer`, `loyalty_account`, `loyalty_account_tier`, `miles_transaction`, `customer_benefit`
- `aeropuerto`: `airport`, `terminal`, `boarding_gate`, `runway`, `airport_regulation`
- `aeronaves`: `aircraft_manufacturer`, `aircraft_model`, `cabin_class`, `aircraft`, `aircraft_cabin`, `aircraft_seat`, `maintenance_provider`, `maintenance_type`, `maintenance_event`
- `operaciones`: `flight_status`, `delay_reason_type`, `flight`, `flight_segment`, `flight_delay`
- `ventas`: `reservation_status`, `sale_channel`, `fare_class`, `fare`, `ticket_status`, `reservation`, `reservation_passenger`, `sale`, `ticket`, `ticket_segment`, `seat_assignment`, `baggage`
- `abordaje`: `boarding_group`, `check_in_status`, `check_in`, `boarding_pass`, `boarding_validation`
- `pagos`: `payment_status`, `payment_method`, `payment`, `payment_transaction`, `refund`
- `facturacion`: `tax`, `exchange_rate`, `invoice_status`, `invoice`, `invoice_line`
- `notificaciones`: `notification_type`, `notification_channel`, `notification_template`, `notification`

## Relaciones relevantes entre dominios

- `clientes` depende de `identidad`
- `ventas` depende de `clientes`, `operaciones`, `aeropuerto`, `aeronaves` e `identidad`
- `abordaje` depende de `ventas` y `operaciones`
- `pagos` depende de `ventas`
- `facturacion` depende de `clientes` y `ventas`
- `notificaciones` se integra con clientes y procesos transaccionales del sistema
- `seguridad` soporta acceso y trazabilidad sobre objetos criticos de negocio

## Capas adicionales del modelo

Ademas de las tablas base, el repo actual incluye:

- 69 indices
- datos base por dominio en `02_dml/00_inserts`
- roles, grants y RLS en `03_dcl`
- configuracion de `search_path` en `01_ddl/10_configuration`

## Observaciones

- Los modulos de views, materialized views, functions, procedures y triggers existen, pero hoy no agregan objetos al modelo.
- El analisis historico de "12 dominios" ya no aplica al estado actual; el repositorio implementa 13 dominios.
