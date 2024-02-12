PREPARE GetOrderDetail FROM
'SELECT o.OrderID, o.OrderDate, o.Quantity, o.TotalCost, o.BookingID, o.MenuID, b.BookingDate 
FROM Orders o
JOIN Bookings b ON o.BookingID = b.BookingID
WHERE b.CustomerID = ?';
SET @id = 1;
EXECUTE GetOrderDetail USING @id;
