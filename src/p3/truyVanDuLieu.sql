use quanlybanhang;

-- CREATE TABLE Customer (
-- cID INT PRIMARY KEY,
-- Name VARCHAR(25),
-- cAge TINYINT
-- );

-- INSERT INTO Customer (cID, Name, cAge)
-- VALUES
-- (1, 'Minh Quan', 10),
-- (2, 'Ngoc Oanh', 20),
-- (3, 'Hong Ha', 50);

-- CREATE TABLE Orders (
-- oID INT PRIMARY KEY,
-- cID INT,
-- oDate DATETIME,
-- oTotalPrice INT,
-- FOREIGN KEY (cID) REFERENCES Customer(cID)
-- );

-- INSERT INTO Orders (oID, cID, oDate)
-- VALUES
-- (1, 1, '2006-03-21'),
-- (2, 2, '2006-03-23'),
-- (3, 1, '2006-03-16');

-- CREATE TABLE Product (
-- pID INT PRIMARY KEY,
-- pName VARCHAR(25),
-- pPrice INT
-- );

-- INSERT INTO Product (pID, pName, pPrice)
-- VALUES
-- (1, 'May Giat', 3),
-- (2, 'Tu Lanh', 5),
-- (3, 'Dieu Hoa', 7),
-- (4, 'Quat', 1),
-- (5, 'Bep Dien', 2);

-- CREATE TABLE OrderDetail (
-- oID INT,
-- pID INT,
-- odQTY INT,
-- FOREIGN KEY (oID) REFERENCES Orders(oID),
-- FOREIGN KEY (pID) REFERENCES Product(pID)
-- );

-- INSERT INTO OrderDetail (oID, pID, odQTY)
-- VALUES
-- (1, 1, 3),
-- (1, 3, 7),
-- (2, 4, 2),
-- (2, 5, 4),
-- (3, 1, 8),
-- (3, 2, 5),
-- (3, 3, 3);

-- Hiển thị thông tin các hóa đơn trong bảng Order
SELECT oID, oDate, oTotalPrice AS oPrice
FROM Orders
# HAVING oTotalPrice > 10
;

-- Hiển thị danh sách khách hàng và sản phẩm đã mua
SELECT Name AS CustomerName, pName AS ProductName
FROM Customer
JOIN Orders using(cID)
JOIN OrderDetail using(oID)
JOIN Product using(pID);

-- Hiển thị tên khách hàng không mua bất kỳ sản phẩm nào
SELECT Name
FROM Customer
WHERE cID NOT IN (SELECT cID FROM orders);

SELECT c.Name
FROM Customer c
LEFT JOIN Orders o ON c.cID = o.cID
WHERE o.oID IS NULL;

-- Hiển thị thông tin giá tiền của từng hóa đơn
SELECT od.oID, o.oDate, SUM(p.pPrice * od.odQTY) AS Price
FROM OrderDetail od
JOIN Product p ON od.pID = p.pID
JOIN Orders o ON od.oID = o.oID
GROUP BY od.oID;