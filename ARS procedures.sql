--These procedures will make it easier to reuse and integrate into applications or reports.

CREATE PROCEDURE GetAvailableSeats
    @FlightID INT,
    @Class VARCHAR(20),
    @StartDate DATETIME,
    @EndDate DATETIME
AS
BEGIN
    SELECT S.seat_id, S.seat_number, S.class
    FROM Seats S
    JOIN Flights F ON S.flight_id = F.flight_id
    WHERE S.is_booked = 0
      AND S.class = @Class
      AND F.flight_id = @FlightID
      AND F.departure_time BETWEEN @StartDate AND @EndDate;
END;


 --Stored Procedure 2: Flight Search by Origin, Destination, and Date Range

CREATE PROCEDURE SearchFlights
    @Origin VARCHAR(50),
    @Destination VARCHAR(50),
    @StartDate DATETIME,
    @EndDate DATETIME
AS
BEGIN
    SELECT flight_id, airline, departure_time, arrival_time
    FROM Flights
    WHERE origin = @Origin
      AND destination = @Destination
      AND departure_time BETWEEN @StartDate AND @EndDate;
END;

--examples
EXEC GetAvailableSeats @FlightID = 1, @Class = 'Economy', @StartDate = '2025-10-20', @EndDate = '2025-10-25';

EXEC SearchFlights @Origin = 'Mumbai', @Destination = 'Delhi', @StartDate = '2025-10-20', @EndDate = '2025-10-25';

--create booking
CREATE PROCEDURE CreateBooking
    @CustomerID INT,
    @FlightID INT,
    @SeatID INT
AS
BEGIN
    -- Insert booking
    INSERT INTO Bookings (passenger_id, flight_id, seat_id, status)
    VALUES (@CustomerID, @FlightID, @SeatID, 'Confirmed');

    -- Mark seat as booked
    UPDATE Seats
    SET is_booked = 1
    WHERE seat_id = @SeatID;
END;

--booking cancellation

CREATE PROCEDURE CancelBooking
    @BookingID INT
AS
BEGIN
    -- Update booking status
    UPDATE Bookings
    SET status = 'Cancelled'
    WHERE booking_id = @BookingID;

    -- Free up the seat
    DECLARE @SeatID INT;
    SELECT @SeatID = seat_id FROM Bookings WHERE booking_id = @BookingID;

    UPDATE Seats
    SET is_booked = 0
    WHERE seat_id = @SeatID;
END;

--example usage
EXEC CreateBooking @CustomerID = 1, @FlightID = 1, @SeatID = 2;

EXEC CancelBooking @BookingID = 5;






