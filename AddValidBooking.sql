DELIMITER //
CREATE PROCEDURE AddValidBooking(IN booking_date DATE, IN table_number INT, IN customer_id INT)
BEGIN
    DECLARE booking_count INT;
	START TRANSACTION;
	
    SELECT COUNT(*) INTO booking_count
    FROM Bookings
    WHERE BookingDate = booking_date AND TableNumber = table_number;
    IF booking_count > 0 THEN 
		ROLLBACK;
        SELECT 'Error Table is already booked for this date.Booking cannot be completed.' AS Status;
	ELSE
		INSERT INTO Bookings (BookingDate, TableNumber, CustomerID)
        VALUES (booking_date, table_number, customer_id);
        COMMIT;
        SELECT 'Success: Booking has been successfully added.' AS Status;
	END IF;
    
END//
DELIMITER ;

CALL AddValidBooking('2024-03-04', 5, 2);