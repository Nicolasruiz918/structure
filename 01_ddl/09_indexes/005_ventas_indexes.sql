-- ============================================
-- VENTAS - Índices
-- ============================================

CREATE INDEX idx_fare_class_cabin_class_id ON ventas.fare_class(cabin_class_id);
CREATE INDEX idx_fare_airline_id ON ventas.fare(airline_id);
CREATE INDEX idx_reservation_status_id ON ventas.reservation(reservation_status_id);
CREATE INDEX idx_reservation_booked_by_customer_id ON ventas.reservation(booked_by_customer_id);
CREATE INDEX idx_reservation_passenger_person_id ON ventas.reservation_passenger(person_id);
CREATE INDEX idx_sale_reservation_id ON ventas.sale(reservation_id);
CREATE INDEX idx_ticket_sale_id ON ventas.ticket(sale_id);
CREATE INDEX idx_ticket_reservation_passenger_id ON ventas.ticket(reservation_passenger_id);
CREATE INDEX idx_ticket_segment_ticket_id ON ventas.ticket_segment(ticket_id);
CREATE INDEX idx_ticket_segment_flight_segment_id ON ventas.ticket_segment(flight_segment_id);
CREATE INDEX idx_seat_assignment_aircraft_seat_id ON ventas.seat_assignment(aircraft_seat_id);
CREATE INDEX idx_baggage_ticket_segment_id ON ventas.baggage(ticket_segment_id);
