create database ARS;
use ARS;
-- Schema Design
--Tables:
CREATE TABLE Flights (
    flight_id INT IDENTITY(1,1) PRIMARY KEY,
    airline VARCHAR(50),
    origin VARCHAR(50),
    destination VARCHAR(50),
    departure_time DATETIME,
    arrival_time DATETIME
);

CREATE TABLE passengers (
    passenger_id INT IDENTITY(1,1) PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);

CREATE TABLE Seats (
    seat_id INT IDENTITY(1,1) PRIMARY KEY,
    flight_id INT,
    seat_number VARCHAR(10),
    class VARCHAR(20),
    is_booked BIT DEFAULT 0,
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);

CREATE TABLE Bookings (
    booking_id INT IDENTITY(1,1) PRIMARY KEY,
    passenger_id INT,
    flight_id INT,
    seat_id INT,
    booking_date DATETIME DEFAULT GETDATE(),
    status VARCHAR(20) DEFAULT 'Confirmed',
    FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id),
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id),
    FOREIGN KEY (seat_id) REFERENCES Seats(seat_id)
);


INSERT INTO Flights (airline, origin, destination, departure_time, arrival_time) VALUES
('IndiGo', 'Mumbai', 'Delhi', '2025-10-20 08:00:00', '2025-10-20 10:00:00'),
('Air India', 'Delhi', 'Bangalore', '2025-10-21 09:30:00', '2025-10-21 12:15:00'),
('SpiceJet', 'Chennai', 'Kolkata', '2025-10-22 14:00:00', '2025-10-22 16:30:00'),
('Vistara', 'Hyderabad', 'Mumbai', '2025-10-23 07:45:00', '2025-10-23 09:30:00'),
('GoAir', 'Pune', 'Ahmedabad', '2025-10-24 11:00:00', '2025-10-24 12:30:00'),
('IndiGo', 'Delhi', 'Goa', '2025-10-25 06:00:00', '2025-10-25 08:30:00'),
('Air India', 'Bangalore', 'Chennai', '2025-10-26 13:00:00', '2025-10-26 14:15:00'),
('SpiceJet', 'Kolkata', 'Delhi', '2025-10-27 17:00:00', '2025-10-27 19:30:00'),
('Vistara', 'Mumbai', 'Jaipur', '2025-10-28 10:00:00', '2025-10-28 12:00:00'),
('GoAir', 'Ahmedabad', 'Hyderabad', '2025-10-29 15:00:00', '2025-10-29 17:00:00');


INSERT INTO passengers(full_name, email, phone) VALUES
('Amit Sharma', 'amit@example.com', '9876543210'),
('Neha Verma', 'neha@example.com', '9123456789'),
('Ravi Kumar', 'ravi@example.com', '9988776655'),
('Priya Singh', 'priya@example.com', '9090909090'),
('Anil Mehta', 'anil@example.com', '9876501234'),
('Sneha Reddy', 'sneha@example.com', '9123409876'),
('Rahul Joshi', 'rahul@example.com', '9012345678'),
('Kavita Nair', 'kavita@example.com', '9876123456'),
('Vikram Desai', 'vikram@example.com', '9988001122'),
('Pooja Iyer', 'pooja@example.com', '9000112233');


-- Seats (for flight_id = 1 to 3)
INSERT INTO Seats (flight_id, seat_number, class) VALUES
(1, '1A', 'Economy'),
(1, '1B', 'Economy'),
(1, '2A', 'Business'),
(2, '3A', 'Economy'),
(2, '3B', 'Economy'),
(2, '4A', 'Business'),
(3, '5A', 'Economy'),
(3, '5B', 'Economy'),
(3, '6A', 'Business'),
(3, '6B', 'Business');


-- Bookings (assuming seat_id 1–10 and customer_id 1–10)
INSERT INTO Bookings (passenger_id, flight_id, seat_id, status) VALUES
(1, 1, 1, 'Confirmed'),
(2, 1, 2, 'Confirmed'),
(3, 1, 3, 'Confirmed'),
(4, 2, 4, 'Confirmed'),
(5, 2, 5, 'Confirmed'),
(6, 2, 6, 'Cancelled'),
(7, 3, 7, 'Confirmed'),
(8, 3, 8, 'Confirmed'),
(9, 3, 9, 'Confirmed'),
(10, 3, 10, 'Confirmed');

