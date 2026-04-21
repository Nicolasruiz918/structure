-- Rollback for 009_create_sales_reservation_tables.sql

DROP INDEX IF EXISTS ventas.ventas.idx_baggage_ticket_segment_id CASCADE;
DROP INDEX IF EXISTS ventas.ventas.idx_seat_assignment_aircraft_seat_id CASCADE;
DROP INDEX IF EXISTS ventas.ventas.idx_ticket_segment_flight_segment_id CASCADE;
DROP INDEX IF EXISTS ventas.ventas.idx_ticket_segment_ticket_id CASCADE;
DROP INDEX IF EXISTS ventas.ventas.idx_ticket_reservation_passenger_id CASCADE;
DROP INDEX IF EXISTS ventas.ventas.idx_ticket_sale_id CASCADE;
DROP INDEX IF EXISTS ventas.ventas.idx_sale_reservation_id CASCADE;
DROP INDEX IF EXISTS ventas.ventas.idx_reservation_passenger_person_id CASCADE;
DROP INDEX IF EXISTS ventas.ventas.idx_reservation_booked_by_customer_id CASCADE;
DROP INDEX IF EXISTS ventas.ventas.idx_reservation_status_id CASCADE;
DROP INDEX IF EXISTS ventas.ventas.idx_fare_airline_id CASCADE;
DROP INDEX IF EXISTS ventas.ventas.idx_fare_class_cabin_class_id CASCADE;

DROP TABLE IF EXISTS ventas.ventas.baggage CASCADE;
DROP TABLE IF EXISTS ventas.ventas.seat_assignment CASCADE;
DROP TABLE IF EXISTS ventas.ventas.ticket_segment CASCADE;
DROP TABLE IF EXISTS ventas.ventas.ticket CASCADE;
DROP TABLE IF EXISTS ventas.ventas.sale CASCADE;
DROP TABLE IF EXISTS ventas.ventas.reservation_passenger CASCADE;
DROP TABLE IF EXISTS ventas.ventas.reservation CASCADE;
DROP TABLE IF EXISTS ventas.ventas.ticket_status CASCADE;
DROP TABLE IF EXISTS ventas.ventas.fare CASCADE;
DROP TABLE IF EXISTS ventas.ventas.fare_class CASCADE;
DROP TABLE IF EXISTS ventas.ventas.sale_channel CASCADE;
DROP TABLE IF EXISTS ventas.ventas.reservation_status CASCADE;


