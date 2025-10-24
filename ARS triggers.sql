--Here are two SQL Server triggers to handle booking updates and cancellations in your Airline Reservation System. These will automatically update the Seats table when a booking is confirmed or cancelled.

-- Trigger 1: Mark Seat as Booked on Booking Insert
CREATE TRIGGER trg_AfterBookingInsert
ON Bookings
AFTER INSERT
AS
BEGIN
    UPDATE Seats
    SET is_booked = 1
    WHERE seat_id IN (SELECT seat_id FROM inserted);
END;


--- This trigger fires after a new booking is inserted.
--It marks the corresponding seat as booked (is_booked = 1).

--

-- Trigger 2: Unmark Seat on Booking Cancellation
CREATE TRIGGER trg_AfterBookingUpdate
ON Bookings
AFTER UPDATE
AS
BEGIN
    UPDATE Seats
    SET is_booked = 0
    WHERE seat_id IN (
        SELECT seat_id
        FROM inserted
        WHERE status = 'Cancelled'
    );
END;


-- This trigger fires after a booking is updated.
 --If the status changes to 'Cancelled', it frees up the seat.