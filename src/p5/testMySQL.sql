/*
Create 8 table
*/
-- use test;
-- CREATE TABLE Customers
-- (
-- CustomerID int,
-- CustomerName varchar(255),
-- ContactName varchar(255),
-- Address varchar(255),
-- City varchar(255),
-- PostalCode varchar(255),
-- Country varchar(255)
-- );

-- CREATE TABLE Categories
-- (
-- CategoryID int,
-- CategoryName varchar(255),
-- Description varchar(255)
-- );

-- CREATE TABLE Employees
-- (
-- EmployeeID int,
-- LastName varchar(255),
-- FirstName varchar(255),
-- BirthDate varchar(255),
-- Photo varchar(255),
-- Notes varchar(255)
-- );

-- CREATE TABLE OrderDetails
-- (
-- OrderDetailID int,
-- OrderID int,
-- ProductID int,
-- Quantity int
-- );

-- CREATE TABLE Orders
-- (
-- OrderID int,
-- CustomerID int,
-- EmployeeID int,
-- OrderDate int,
-- ShipperID int
-- );

-- CREATE TABLE Products
-- (
-- ProductID int,
-- ProductName varchar(255),
-- SupplierID int,
-- CategoryID int,
-- Unit varchar(255),
-- Price int
-- );

-- CREATE TABLE Shippers
-- (
-- ShipperID int,
-- ShipperName varchar(255),
-- Phone varchar(255)
-- );

-- CREATE TABLE Suppliers
-- (
-- SupplierID int,
-- SupplierName varchar(255),
-- ContactName varchar(255),
-- Address varchar(255),
-- City varchar(255),
-- PostalCode varchar(255),
-- Country varchar(255),
-- Phone varchar(255)
-- );

-- /*
-- Insert DB for 8 table
-- */

-- INSERT INTO Customers (CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country)
-- VALUES (1, 'Nguyễn Văn Linh','Linh','Số 16C Tôn Đức Thắng, phường Mỹ Bình','Long Xuyên','4006','VN'),
-- (2, 'Hồ Bích Hà','Hà','Số 1 Phạm Văn Đồng, phường Phước Trung','TP.Bạc Liêu','4007','VN'),
-- (3, 'Tăng Văn Lộc','Lộc','Số 04 đường Phan Đình Phùng, phường 3','TP. Bà Rịa','4008','VN'),
-- (4, 'Nguyễn Long Chiến','Chiến','Số 82  đường Hùng Vương','TP. Bắc Giang','4009','VN'),
-- (5, 'Thái Văn Luyện','Luyện','Tổ 1A, phường Phùng Chí Kiên','Bắc Kạn','4010','US'),
-- (6, 'Nguyễn Văn Tiến','Tiến','Số 10  đường Phù Đổng Thiên Vươn, phường Suối Hoa','TP.Bắc Ninh','4011','UK'),
-- (7, 'Lê Thị Thảo','Thảo','Số 7 đường Cách Mạng Tháng 8','TP. Bến Tre','4012','UK');

-- INSERT INTO Categories (CategoryID, CategoryName, Description)
-- VALUES (1, 'Trái cây','Ăn cam hàng ngày sẽ cho bạn một lượng Vitamin C '),
-- (2, 'Nước','Mặc dù nước thì không chứa dưỡng chất, nó thì cần thiết cho sức khoẻ của bạn'),
-- (3, 'Hạt','Hạt óc chó chứa các a-xít béo không bão hoà đa'),
-- (4, 'Gạo ','Thực phẩm chính'),
-- (5, 'Rau','Rau cải chân vịt (rau bó xôi) có chứa rất nhiều chất dinh dưỡng'),
-- (6, 'Thịt','Cá hoặc thịt gia cầm đóng hộp có nhiều chất dinh dưỡng nhưng chúng lại thường có nhiều'),
-- (7, 'Cá hộp','Cũng như những thực phẩm đóng hộp khác'),
-- (8, 'Gà','Gà rán');


-- INSERT INTO Employees (EmployeeID, LastName, FirstName, BirthDate, Photo, Notes)
-- VALUES (1, 'Nguyễn','Lọ','12/8/1962','photo 1','4006'),
-- (2, 'Hồ','Rich','12/8/1963','photo 2','4007'),
-- (3, 'Lê','Xuân Trường','13/2/1962','photo 3','4008'),
-- (4, 'Xuân','Hay','12/1/1962','photo 3','4009'),
-- (5, 'Văn','Nguyễn Tiến','15/8/1962','photo 6','4010'),
-- (6, 'Hồ','Trường','12/3/1962','photo 4','4011'),
-- (7, 'Nguyễn','Lan','14/8/1962','photo 5','4012');

-- INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
-- VALUES (1,1,3,25),
-- (2,2,1,255),
-- (3,4,3,26),
-- (4,5,1,24),
-- (5,2,1,22),
-- (6,2,5,233);

-- INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate, ShipperID)
-- VALUES 
--     (1,1,2,STR_TO_DATE('12/1/1962', '%d/%m/%Y'),1),
--     (2,2,3,STR_TO_DATE('22/2/1962', '%d/%m/%Y'),2),
--     (3,3,1,STR_TO_DATE('20/3/1962', '%d/%m/%Y'),5),
--     (4,4,4,STR_TO_DATE('18/4/1962', '%d/%m/%Y'),3),
--     (5,5,5,STR_TO_DATE('17/6/1962', '%d/%m/%Y'),5),
--     (6,4,6,STR_TO_DATE('15/7/1962', '%d/%m/%Y'),2),
--     (7,5,3,STR_TO_DATE('14/2/1962', '%d/%m/%Y'),6),
--     (8,2,1,STR_TO_DATE('13/5/1962', '%d/%m/%Y'),4);

-- INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, Unit, Price)
-- VALUES (1, 'Cơm',2,2,'ONE',4006),
-- (2, 'Cá nướng',1,1,'ONE',4006),
-- (3, 'Gà chiên',3,3,'ONE',4006),
-- (4, 'Hạt đậu',2,4,'ONE',4006),
-- (5, 'Rau muống',1,5,'ONE',4006),
-- (6, 'Hạt đậu xanh',4,6,'ONE',4006),
-- (7, 'Cơm rau',5,4,'ONE',4006);


-- INSERT INTO Shippers (ShipperID, ShipperName, Phone)
-- VALUES (1, 'Hoá','400631434324'),
-- (2, 'Trăng','4006314343334'),
-- (3, 'Trời','400631434324'),
-- (4, 'Hoa','4006344324'),
-- (5, 'Sao','4006312224'),
-- (6, 'Hào','40324'),
-- (7, 'Hiền','400611134324');

-- INSERT INTO Suppliers (SupplierID, SupplierName, ContactName, Address, City, PostalCode,Country,Phone)
-- VALUES (1, 'Tinh Hoa','Hoa','TX.Đồng Xoài, tỉnh Bình Phước','Stave er','4006','UK','1234'),
-- (2, 'B','Toàn Nguyễn','Toàn','Số 04 Hải Thượng Lãn Ông','4006','VN','543'),
-- (3, 'D','Long Ruồi','Long','Số 011 đường Hoàng Đình Giong','4006','VN','5432'),
-- (4, 'E','XUân Tiến','XUân','Phường Mường Thanh, TP.Điện Biên Phủ','US','4006','5432346'),
-- (5, 'G','Hoang Vu','Hoang','02 Hòa Bình, phường Tân An','4006','UK','8765'),
-- (6, 'X','Lương Hồ','Lương','Số 31 Trần Phú, Q.Hải Châu','4006','VN','654345'),
-- (7, 'W','Ken','Ken','Đường 23 tháng 3, TX.Gia Nghĩa','4006','VN','54345');