SELECT c.CustomerID, CONCAT(c.GuestFirstName, ' ',c.GuestLastName) AS CustomerName, 
o.OrderID, o.TotalCost, 
m.MenuID, m.Name, 
b.BookingID
FROM Customer c JOIN Bookings b ON c.CustomerID = b.CustomerID
JOIN Orders o ON b.BookingID = o.BookingID
JOIN Menu m ON o.MenuID = m.MenuID
WHERE o.TotalCost > 150
ORDER BY o.TotalCost ASC;