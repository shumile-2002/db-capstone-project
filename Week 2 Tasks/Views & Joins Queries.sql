-- Task 1 (Views)
CREATE VIEW OrdersView AS
SELECT OrderID, Quantity, Cost
FROM  orders 
WHERE Quantity > 2;


-- Task 2 (Joins)
Select customers.CustomerID, customers.FullName, 
	   orders.OrderID, orders.Cost, menus.MenuName,
       menuitems.CourseName, menuitems.StarterName
FROM customers INNER JOIN orders 
ON customers.CustomerID = orders.CustomerID INNER JOIN menus
ON orders.MenuID = menus.MenuID INNER JOIN menuitems 
ON menuitems.MenuItemsID = menus.MenuItemsID 
WHERE Cost > 150 ORDER BY Cost ASC;

