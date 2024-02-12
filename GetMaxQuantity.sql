DELIMITER //
CREATE PROCEDURE GetMaxQuantity()
BEGIN
SELECT MAX(Quantity) AS `Max Quantity In Order`
FROM Orders;
END //
DELIMITER ;

CALL GetMaxQuantity();