-- ============================================
-- VENTAS - Rollback Índices
-- ============================================

DROP INDEX IF EXISTS ventas.idx_fare_class_cabin_class_id;
DROP INDEX IF EXISTS ventas.idx_fare_airline_id;
DROP INDEX IF EXISTS ventas.idx_reservation_status_id;
DROP INDEX IF EXISTS ventas.idx_reservation_booked_by_customer_id;
DROP INDEX IF EXISTS ventas.idx_reservation_passenger_person_id;
DROP INDEX IF EXISTS ventas.idx_sale_reservation_id;
DROP INDEX IF EXISTS ventas.idx_ticket_sale_id;
DROP INDEX IF EXISTS ventas.idx_ticket_reservation_passenger_id;
DROP INDEX IF EXISTS ventas.idx_ticket_segment_ticket_id;
DROP INDEX IF EXISTS ventas.idx_ticket_segment_flight_segment_id;
DROP INDEX IF EXISTS ventas.idx_seat_assignment_aircraft_seat_id;
DROP INDEX IF EXISTS ventas.idx_baggage_ticket_segment_id;
