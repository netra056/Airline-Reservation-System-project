
/*Schema Normalization
Normalization ensures data integrity and reduces redundancy. Your schema is already well-structured, but here's how it aligns with the first three normal forms:
✅ First Normal Form (1NF)
- All attributes contain atomic values.
- Each record is unique and has a primary key.
✅ Second Normal Form (2NF)
- All non-key attributes are fully functionally dependent on the primary key.
- No partial dependencies (since no composite keys are used).
✅ Third Normal Form (3NF)
- No transitive dependencies.
- Each non-key attribute depends only on the primary key.
Your schema satisfies 1NF, 2NF, and 3NF.*/




 /*1. Query for Available Seats on a Specific Flight
This query lists all unbooked seats for a given flight_id:*/
SELECT S.seat_id, S.seat_number, S.class
FROM Seats S
WHERE S.flight_id = 2 AND S.is_booked = 0;


--Replace @FlightID with the desired flight number (e.g., 1).

/*2. Query to Search Flights by Origin and Destination
This query finds flights between two cities:*/
SELECT flight_id, airline, departure_time, arrival_time
FROM Flights
WHERE origin = 'Mumbai' AND destination = 'Delhi';


--Replace @Origin and @Destination with city names like 'Mumbai' and 'Delhi'.


--two queries with filters for date ranges and seat class:

-- 1. Available Seats by Flight, Class, and Date
SELECT S.seat_id, S.seat_number, S.class
FROM Seats S
JOIN Flights F ON S.flight_id = F.flight_id
WHERE S.is_booked = 0
  AND S.class = 'economy'
  AND F.flight_id = 1
  AND F.departure_time BETWEEN '2520-10-20' AND '2025-10-23';

/*- @Class: e.g., 'Economy' or 'Business'
- @FlightID: e.g., 1
- @StartDate and @EndDate: e.g., '2025-10-20' to '2025-10-25'*/

--2. Flight Search by Origin, Destination, and Date Range
SELECT flight_id, airline, departure_time, arrival_time
FROM Flights
WHERE origin = 'hyderabad'
  AND destination = 'delhi'
  AND departure_time BETWEEN '2025-10-25' AND '2025-10-28';






