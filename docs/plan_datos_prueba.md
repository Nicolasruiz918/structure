# Plan de Datos de Prueba - Orden de Inserción por Dependencias

**Proyecto:** Análisis y Desarrollo de Software - Sistema de Gestión de Aerolínea  
**Componente:** Base de Datos de Prueba  
**Objetivo:** Proporcionar datos coherentes y con integridad referencial para pruebas funcionales  

---

## 📋 Resumen Ejecutivo

Este documento define el **orden de inserción de datos de prueba** respetando las dependencias de llaves foráneas entre tablas. Se incluyen scripts SQL organizados por dominio y validaciones de integridad referencial.

**Total de entidades (tablas):** 80  
**Total de registros propuestos:** 400+ (5 por tabla promedio)  
**Dominios:** 13 (ordenados por dependencias)  
**Estructura de archivos:** `02_dml/00_inserts/`  

---

## 🔗 Diagrama de Dependencias

```
1. GEOGRAFÍA (Sin FK externas)
   ├── continent
   ├── country (← continent)
   ├── state_province (← country)
   ├── city (← state_province, time_zone)
   ├── district (← city)
   ├── address (← district)
   ├── currency
   └── time_zone

2. AEROLINEA (FK → geografía)
   └── airline (← address)

3. IDENTIDAD (Sin FK externas)
   ├── person_type
   ├── document_type
   ├── contact_type
   ├── person (← person_type, country/nationality)
   ├── person_document (← person, document_type)
   └── person_contact (← person, contact_type)

4. SEGURIDAD (Sin FK externas a otros dominios)
   ├── user_status
   ├── security_role
   ├── security_permission
   ├── user_account (← person, user_status)
   ├── user_role (← user_account, security_role)
   └── role_permission (← security_role, security_permission)

5. CLIENTES (FK → identidad, aerolinea)
   ├── customer_category
   ├── benefit_type
   ├── loyalty_program (← airline)
   ├── loyalty_tier
   ├── customer (← person)
   ├── loyalty_account (← customer, loyalty_program)
   ├── loyalty_account_tier (← loyalty_account, loyalty_tier)
   ├── customer_benefit (← customer, benefit_type)
   └── miles_transaction (← loyalty_account)

6. AEROPUERTO (FK → geografía)
   ├── airport (← address)
   ├── terminal (← airport)
   ├── boarding_gate (← terminal)
   ├── runway (← airport)
   └── airport_regulation (← airport)

7. AERONAVES (FK → aerolinea, geografía)
   ├── aircraft_manufacturer
   ├── aircraft_model (← aircraft_manufacturer)
   ├── cabin_class
   ├── aircraft (← airline, aircraft_model)
   ├── aircraft_cabin (← aircraft, cabin_class)
   ├── aircraft_seat (← aircraft_cabin)
   ├── maintenance_provider (← address)
   ├── maintenance_type
   └── maintenance_event (← aircraft, maintenance_type, maintenance_provider)

8. OPERACIONES (FK → aerolinea, aeronaves, aeropuerto)
   ├── flight_status
   ├── delay_reason_type
   ├── flight (← airline, aircraft, flight_status)
   ├── flight_segment (← flight, airport[origen/destino])
   └── flight_delay (← flight_segment, delay_reason_type)

9. VENTAS (FK → operaciones, clientes, aeronaves)
   ├── reservation_status
   ├── sale_channel
   ├── fare_class
   ├── fare (← airline)
   ├── ticket_status
   ├── reservation (← reservation_status, customer, sale_channel)
   ├── reservation_passenger (← reservation, person)
   ├── sale (← reservation)
   ├── ticket (← sale, reservation_passenger)
   ├── ticket_segment (← ticket, flight_segment)
   ├── seat_assignment (← ticket_segment, aircraft_seat)
   └── baggage (← ticket_segment)

10. ABORDAJE (FK → ventas, aeropuerto, seguridad)
    ├── boarding_group
    ├── check_in_status
    ├── check_in (← ticket_segment, check_in_status, boarding_group, user_account)
    ├── boarding_pass (← check_in)
    └── boarding_validation (← boarding_pass, boarding_gate, user_account)

11. PAGOS (FK → ventas, geografía)
    ├── payment_status
    ├── payment_method
    ├── payment (← sale, payment_status, payment_method, currency)
    ├── payment_transaction (← payment)
    └── refund (← payment)

12. FACTURACIÓN (FK → ventas, geografía)
    ├── tax
    ├── exchange_rate (← currency)
    ├── invoice_status
    ├── invoice (← sale, invoice_status, currency)
    └── invoice_line (← invoice, tax)

13. NOTIFICACIONES (Sin FK externas complejas)
    ├── notification_type
    ├── notification_channel
    ├── notification_template (← notification_type, notification_channel)
    └── notification (← notification_template)
```

---

## 📂 Estructura de Archivos DML

```
02_dml/
└── 00_inserts/
    ├── changelog.yaml
    ├── 001_insert_geografia.sql
    ├── 002_insert_aerolinea.sql
    ├── 003_insert_identidad.sql
    ├── 004_insert_seguridad.sql
    ├── 005_insert_clientes.sql
    ├── 006_insert_aeropuerto.sql
    ├── 007_insert_aeronaves.sql
    ├── 008_insert_operaciones.sql
    ├── 009_insert_ventas.sql
    ├── 010_insert_abordaje.sql
    ├── 011_insert_pagos.sql
    ├── 012_insert_facturacion.sql
    └── 013_insert_notificaciones.sql
```

---

## 🗂️ Orden de Inserción (Crítico)

### 1️⃣ GEOGRAFÍA - Datos de Referencia Base

**Archivo:** `001_insert_geografia.sql`  
**Dependencias:** Ninguna  
**Datos a insertar:**

```sql
-- time_zone (sin dependencias)
INSERT INTO geografia.time_zone (zone_id, zone_name, utc_offset) VALUES
  ('tz001', 'America/Bogota', -5),
  ('tz002', 'America/Mexico_City', -6),
  ('tz003', 'America/New_York', -5),
  ('tz004', 'Europe/Madrid', 1),
  ('tz005', 'Asia/Tokyo', 9);

-- continent (sin dependencias)
INSERT INTO geografia.continent (continent_code, continent_name) VALUES
  ('NA', 'North America'),
  ('SA', 'South America'),
  ('EU', 'Europe'),
  ('AS', 'Asia'),
  ('AF', 'Africa');

-- currency (sin dependencias)
INSERT INTO geografia.currency (currency_code, currency_name) VALUES
  ('USD', 'United States Dollar'),
  ('COP', 'Colombian Peso'),
  ('EUR', 'Euro'),
  ('JPY', 'Japanese Yen'),
  ('GBP', 'British Pound');

-- country (FK → continent)
INSERT INTO geografia.country (continent_id, iso_alpha2, iso_alpha3, country_name) VALUES
  ((SELECT continent_id FROM geografia.continent WHERE continent_code='SA'), 'CO', 'COL', 'Colombia'),
  ((SELECT continent_id FROM geografia.continent WHERE continent_code='NA'), 'MX', 'MEX', 'Mexico'),
  ((SELECT continent_id FROM geografia.continent WHERE continent_code='NA'), 'US', 'USA', 'United States'),
  ((SELECT continent_id FROM geografia.continent WHERE continent_code='EU'), 'ES', 'ESP', 'Spain'),
  ((SELECT continent_id FROM geografia.continent WHERE continent_code='AS'), 'JP', 'JPN', 'Japan');

-- state_province (FK → country)
INSERT INTO geografia.state_province (country_id, state_code, state_name) VALUES
  ((SELECT country_id FROM geografia.country WHERE iso_alpha2='CO'), 'DC', 'Distrito Capital'),
  ((SELECT country_id FROM geografia.country WHERE iso_alpha2='CO'), 'AT', 'Atlantico'),
  ((SELECT country_id FROM geografia.country WHERE iso_alpha2='MX'), 'MX', 'Mexico'),
  ((SELECT country_id FROM geografia.country WHERE iso_alpha2='US'), 'NY', 'New York'),
  ((SELECT country_id FROM geografia.country WHERE iso_alpha2='US'), 'CA', 'California');

-- city (FK → state_province, time_zone)
INSERT INTO geografia.city (state_province_id, time_zone_id, city_code, city_name) VALUES
  ((SELECT state_province_id FROM geografia.state_province WHERE state_code='DC'), (SELECT zone_id FROM geografia.time_zone WHERE zone_id='tz001'), 'BOG', 'Bogota'),
  ((SELECT state_province_id FROM geografia.state_province WHERE state_code='AT'), (SELECT zone_id FROM geografia.time_zone WHERE zone_id='tz001'), 'BAQ', 'Barranquilla'),
  ((SELECT state_province_id FROM geografia.state_province WHERE state_code='MX'), (SELECT zone_id FROM geografia.time_zone WHERE zone_id='tz002'), 'MEX', 'Mexico City'),
  ((SELECT state_province_id FROM geografia.state_province WHERE state_code='NY'), (SELECT zone_id FROM geografia.time_zone WHERE zone_id='tz003'), 'NYC', 'New York City'),
  ((SELECT state_province_id FROM geografia.state_province WHERE state_code='CA'), (SELECT zone_id FROM geografia.time_zone WHERE zone_id='tz003'), 'LAX', 'Los Angeles');

-- district (FK → city)
INSERT INTO geografia.district (city_id, district_code, district_name) VALUES
  ((SELECT city_id FROM geografia.city WHERE city_code='BOG'), 'D1', 'Chapinero'),
  ((SELECT city_id FROM geografia.city WHERE city_code='BOG'), 'D2', 'La Candelaria'),
  ((SELECT city_id FROM geografia.city WHERE city_code='MEX'), 'D1', 'Benito Juarez'),
  ((SELECT city_id FROM geografia.city WHERE city_code='NYC'), 'D1', 'Manhattan'),
  ((SELECT city_id FROM geografia.city WHERE city_code='LAX'), 'D1', 'Downtown LA');

-- address (FK → district)
INSERT INTO geografia.address (district_id, street_address, city, postal_code) VALUES
  ((SELECT district_id FROM geografia.district WHERE district_code='D1' LIMIT 1), 'Calle 72 #10-50', 'Bogota', '110221'),
  ((SELECT district_id FROM geografia.district WHERE district_code='D2' LIMIT 1), 'Carrera 8 #12-34', 'Bogota', '110111'),
  ((SELECT district_id FROM geografia.district WHERE district_code='D1' LIMIT 2), 'Paseo de la Reforma 505', 'Mexico City', '06500'),
  ((SELECT district_id FROM geografia.district WHERE district_code='D1' LIMIT 1 OFFSET 1), 'Fifth Avenue 350', 'New York', '10118'),
  ((SELECT district_id FROM geografia.district WHERE district_code='D1' LIMIT 1 OFFSET 1), 'Hollywood Boulevard 6925', 'Los Angeles', '90028');
```

**Validaciones:**
- ✅ 5 time zones
- ✅ 5 continentes
- ✅ 5 monedas
- ✅ 5 países
- ✅ 5 estados/provincias
- ✅ 5 ciudades
- ✅ 5 distritos
- ✅ 5 direcciones

---

### 2️⃣ AEROLINEA - Dominio de Aerolíneas

**Archivo:** `002_insert_aerolinea.sql`  
**Dependencias:** Geografía (address)

```sql
INSERT INTO aerolinea.airline (address_id, airline_name, iata_code, icao_code) VALUES
  ((SELECT address_id FROM geografia.address LIMIT 1), 'Aerolínea Colombia', 'AC', 'AECOCP'),
  ((SELECT address_id FROM geografia.address LIMIT 1 OFFSET 1), 'Airline Mexico', 'AM', 'MEXAIR'),
  ((SELECT address_id FROM geografia.address LIMIT 1 OFFSET 2), 'Airline USA', 'UA', 'UNITED'),
  ((SELECT address_id FROM geografia.address LIMIT 1 OFFSET 3), 'Airline Europe', 'IB', 'IBERIA'),
  ((SELECT address_id FROM geografia.address LIMIT 1 OFFSET 4), 'Airline Asia', 'JL', 'JAPAN');
```

---

### 3️⃣ IDENTIDAD - Gestión de Personas

**Archivo:** `003_insert_identidad.sql`  
**Dependencias:** Geografía (país/nacionalidad)

```sql
-- person_type
INSERT INTO identidad.person_type (type_code, type_name) VALUES
  ('TP001', 'Natural Person'),
  ('TP002', 'Legal Entity'),
  ('TP003', 'Passenger'),
  ('TP004', 'Employee'),
  ('TP005', 'Partner');

-- document_type
INSERT INTO identidad.document_type (type_code, type_name) VALUES
  ('CC', 'Cedula Ciudadania'),
  ('CE', 'Cedula Extranjeria'),
  ('PA', 'Pasaporte'),
  ('TI', 'Tarjeta de Identidad'),
  ('PEP', 'Permiso Especial');

-- contact_type
INSERT INTO identidad.contact_type (type_code, type_name) VALUES
  ('EMAIL', 'Email'),
  ('PHONE', 'Phone'),
  ('MOBILE', 'Mobile'),
  ('WHATSAPP', 'WhatsApp'),
  ('FAX', 'Fax');

-- person (FK → person_type, nationality_country_id)
INSERT INTO identidad.person (person_type_id, first_name, last_name, nationality_country_id) VALUES
  ((SELECT person_type_id FROM identidad.person_type WHERE type_code='TP003'), 'Juan', 'Perez', (SELECT country_id FROM geografia.country WHERE iso_alpha2='CO')),
  ((SELECT person_type_id FROM identidad.person_type WHERE type_code='TP003'), 'Maria', 'Garcia', (SELECT country_id FROM geografia.country WHERE iso_alpha2='CO')),
  ((SELECT person_type_id FROM identidad.person_type WHERE type_code='TP004'), 'Carlos', 'Lopez', (SELECT country_id FROM geografia.country WHERE iso_alpha2='MX')),
  ((SELECT person_type_id FROM identidad.person_type WHERE type_code='TP003'), 'Ana', 'Martinez', (SELECT country_id FROM geografia.country WHERE iso_alpha2='US')),
  ((SELECT person_type_id FROM identidad.person_type WHERE type_code='TP003'), 'Luis', 'Rodriguez', (SELECT country_id FROM geografia.country WHERE iso_alpha2='ES'));

-- person_document (FK → person, document_type)
INSERT INTO identidad.person_document (person_id, document_type_id, document_number, issued_at) VALUES
  ((SELECT person_id FROM identidad.person WHERE last_name='Perez' LIMIT 1), (SELECT document_type_id FROM identidad.document_type WHERE type_code='CC'), '1023456789', NOW()),
  ((SELECT person_id FROM identidad.person WHERE last_name='Garcia' LIMIT 1), (SELECT document_type_id FROM identidad.document_type WHERE type_code='CC'), '1023456780', NOW()),
  ((SELECT person_id FROM identidad.person WHERE last_name='Lopez' LIMIT 1), (SELECT document_type_id FROM identidad.document_type WHERE type_code='PA'), 'PA123456', NOW()),
  ((SELECT person_id FROM identidad.person WHERE last_name='Martinez' LIMIT 1), (SELECT document_type_id FROM identidad.document_type WHERE type_code='PA'), 'PA654321', NOW()),
  ((SELECT person_id FROM identidad.person WHERE last_name='Rodriguez' LIMIT 1), (SELECT document_type_id FROM identidad.document_type WHERE type_code='PA'), 'PA789012', NOW());

-- person_contact (FK → person, contact_type)
INSERT INTO identidad.person_contact (person_id, contact_type_id, contact_value) VALUES
  ((SELECT person_id FROM identidad.person WHERE last_name='Perez' LIMIT 1), (SELECT contact_type_id FROM identidad.contact_type WHERE type_code='EMAIL'), 'juan.perez@email.com'),
  ((SELECT person_id FROM identidad.person WHERE last_name='Garcia' LIMIT 1), (SELECT contact_type_id FROM identidad.contact_type WHERE type_code='PHONE'), '+57 301 1234567'),
  ((SELECT person_id FROM identidad.person WHERE last_name='Lopez' LIMIT 1), (SELECT contact_type_id FROM identidad.contact_type WHERE type_code='EMAIL'), 'carlos.lopez@email.com'),
  ((SELECT person_id FROM identidad.person WHERE last_name='Martinez' LIMIT 1), (SELECT contact_type_id FROM identidad.contact_type WHERE type_code='MOBILE'), '+1 212 555 0100'),
  ((SELECT person_id FROM identidad.person WHERE last_name='Rodriguez' LIMIT 1), (SELECT contact_type_id FROM identidad.contact_type WHERE type_code='EMAIL'), 'luis.rodriguez@email.com');
```

---

## ⏳ Continuación (HU-007 en progreso)

Los scripts para **Seguridad**, **Clientes**, **Aeropuerto**, **Aeronaves**, **Operaciones**, **Ventas**, **Abordaje**, **Pagos**, **Facturación** y **Notificaciones** siguen el mismo patrón:

1. **Tablas sin FK externas primero** (tipos, estados, categorías)
2. **Tablas con FK simples** (referencias a tabla padre)
3. **Tablas con FK complejas** (referencias múltiples)

---

## ✅ Checklist de Validación

- [ ] Geografía: 5 continentes, 5 países, 5 ciudades, 5 direcciones
- [ ] Aerolinea: 5 aerolíneas
- [ ] Identidad: 5 personas con documentos y contactos
- [ ] Seguridad: Roles, usuarios, permisos
- [ ] Clientes: Clientes con programas de lealtad
- [ ] Aeropuerto: Aeropuertos, terminales, puertas
- [ ] Aeronaves: Modelos, cabinas, asientos
- [ ] Operaciones: Vuelos, segmentos
- [ ] Ventas: Reservas, tickets, asientos
- [ ] Abordaje: Check-in, boarding pass
- [ ] Pagos: Pagos, transacciones
- [ ] Facturación: Facturas, líneas
- [ ] Notificaciones: Tipos, canales, plantillas

---

## 📝 Notas Técnicas

**Consideraciones:**
- Usar UUIDs generados por PostgreSQL (`gen_random_uuid()`)
- Respetar todas las FK constraints
- Validar datos realistas (ej: códigos IATA de 3 caracteres)
- Mantener coherencia entre dominios
- Timestamps automáticos (`now()`)

**Testing:**
```bash
# Después de insertar datos:
docker-compose exec aerolinea_postgres psql -U admin -d aerolinea -c "SELECT COUNT(*) FROM pg_tables WHERE schemaname NOT IN ('pg_catalog', 'information_schema');"
docker-compose exec aerolinea_postgres psql -U admin -d aerolinea -c "SELECT COUNT(*) FROM geografia.continent;"
```

---

**Estado:** ⏳ EN PROGRESO  
**Última actualización:** 2026-04-19  
**Próxima actualización:** Cuando se completen todos los scripts DML
