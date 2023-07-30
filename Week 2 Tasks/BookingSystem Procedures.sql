-- Tasks (TableBookingSystem)

DELIMITER //


-- Task 1 AddBooking()
CREATE PROCEDURE AddBooking (IN BookingID INT, IN CustomerID INT, IN TableNumber INT, IN BookingDate DATE)
BEGIN
    INSERT INTO booking (bookingid, customerid, tablenumber, date) 
    VALUES (BookingID, CustomerID, TableNumber, BookingDate);
END//

-- Task 2 CheckBooking()
CREATE PROCEDURE CheckBooking(IN BookingDate DATE, IN TableNumber INT)
SELECT BookingDate, TableNumber
WHERE exists (SELECT * from Booking where Date = BookingDate and TableNumber = TableNumber)

-- Task 3 AddValigBooking()
CREATE PROCEDURE AddValidBooking (IN BookingDate DATE, IN TableNumber INT)

START TRANSACTION;

SELECT BookingDate, TableNumber
WHERE exists (SELECT * from Booking where Date = BookingDate and TableNumber = TableNumber)

	INSERT INTO booking (date, table_number)
	VALUES (BookingDate, TableNumber);
    
	COMMIT;
    
-- Task 4 UpdateBooking()
CREATE PROCEDURE UpdateBooking (IN BookingID INT, IN BookingDate DATE)
BEGIN
UPDATE booking SET date = BookingDate WHERE booking_id = BookingID; 
END

 
DELIMITER ;
