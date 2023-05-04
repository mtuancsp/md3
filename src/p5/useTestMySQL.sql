-- SELECT Orders.OrderID, Customers.CustomerName
-- FROM Orders
-- JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

-- SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
-- FROM Orders
-- JOIN Customers ON Orders.CustomerID = Customers.CustomerID
-- JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID;

-- SELECT Customers.CustomerName, Orders.OrderID
-- FROM Customers
-- LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
-- ORDER BY Customers.CustomerName;

-- SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
-- FROM Orders
-- RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
-- ORDER BY Orders.OrderID; 

-- SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.Country
-- FROM Customers A, Customers B
-- WHERE A.CustomerID < B.CustomerID
-- AND A.Country = B.Country
-- ORDER BY A.Country;

-- select city from customers
-- union
-- select city from suppliers
-- order by city;

-- SELECT City, Country FROM Customers
-- WHERE Country='VN'
-- UNION ALL
-- SELECT City, Country FROM Suppliers
-- WHERE Country='VN'
-- ORDER BY City;

-- SELECT SupplierName
-- FROM Suppliers
-- WHERE EXISTS (
-- SELECT ProductName 
-- FROM Products 
-- WHERE Products.SupplierID = Suppliers.supplierID AND Price < 5000
-- );

-- SELECT ProductName
-- FROM Products
-- WHERE ProductID = ANY (
-- SELECT ProductID FROM OrderDetails WHERE Quantity > 1);

SELECT COUNT(CustomerId), Country
FROM Customers
GROUP BY Country;

SELECT Shippers.ShipperName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM Orders
LEFT JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
GROUP BY ShipperName;
-- DELIMITER //
-- CREATE PROCEDURE SelectAllCustomers()
-- BEGIN
--   SELECT * FROM Customers;
-- END //
-- DELIMITER ;

call SelectAllCustomers();