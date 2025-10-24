--Here’s a SQL Server query to generate a comprehensive ✈️ Booking Summary Report for your Airline Reservation System. This report combines data from all relevant tables to show who booked what, on which flight, and the current status.

-- Booking Summary Report Query
SELECT 
    B.booking_id,
    C.full_name AS customer_name,
    C.email,
    F.airline,
    F.origin,
    F.destination,
    F.departure_time,
    F.arrival_time,
    S.seat_number,
    S.class,
    B.status,
    B.booking_date
FROM Bookings B
JOIN passengers C ON B.booking_id = C.passenger_id
JOIN Flights F ON B.flight_id = F.flight_id
JOIN Seats S ON B.seat_id = S.seat_id
ORDER BY B.booking_date DESC;


/* What This Report Includes
- Booking ID and status
- Customer name and contact
- Flight details: airline, route, schedule
- Seat number and class
- Booking timestamp*/


