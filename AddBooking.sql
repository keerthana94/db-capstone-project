DELIMITER //
CREATE PROCEDURE AddBooking(IN booking_id INT,IN customer_id INT, IN booking_date DATE, IN table_number INT, IN booking_slot TIME)
BEGIN
	INSERT INTO Bookings (BookingID, CustomerID, BookingDate, TableNumber, BookingSlot)
    VALUES (booking_id, customer_id, booking_date, table_number, booking_slot);
END//
DELIMITER ;

CALL AddBooking(11,11, '2024-03-11',6, '20:00:00');