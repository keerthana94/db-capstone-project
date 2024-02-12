DELIMITER //
CREATE PROCEDURE CheckBooking(IN booking_date DATE, table_number INT)
BEGIN
	DECLARE booking_count INT;
    SELECT COUNT(*) INTO booking_count
    FROM Bookings
    WHERE BookingDate = booking_date AND TableNumber = table_number;
    IF booking_count > 0 THEN 
		SELECT 'Table is already booked.' AS Status;
	ELSE 
		SELECT 'Table is available.' AS Status;
	END IF;
END //
DELIMITER ; 

CALL CheckBooking('2024-03-03', 5);