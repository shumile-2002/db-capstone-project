-- Task 1 (GetMaxQuantity)
CREATE PROCEDURE GetMaxQuantity()
SELECT max(Quantity) AS 'Max Quantity In Order' FROM orders;

-- Task 2 (GetOrderDetail)
DELIMITER //

CREATE PROCEDURE GetOrderDetail(IN id INT)
BEGIN
    PREPARE stmt FROM 'SELECT OrderID, Quantity, TotalCost FROM Orders WHERE OrderID = ?';
    SET @id = id;
    EXECUTE stmt USING @id;
    DEALLOCATE PREPARE stmt;
END//

DELIMITER ;

-- Task 3 (Cancel Order)
CREATE PROCEDURE CancelOrder(IN OrderID INT)
DELETE FROM orders;
