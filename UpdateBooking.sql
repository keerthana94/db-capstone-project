DELIMITER //
CREATE PROCEDURE UpdateBooking(IN booking_id INT, IN booking_date DATE)
BEGIN
	UPDATE Bookings
    SET BookingDate = new_booking_date
    WHERE BookingID = booking_id;
END //
DELIMITER ;