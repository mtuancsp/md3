use classicmodels;

#đưa ra các đơn hàng có trạng thái là ‘On Hold’ hoặc ‘In Process’
SELECT *
FROM orders
WHERE status = 'On Hold'
   or status = 'In Process';

#Đưa ra các khách hàng chưa được gán nhân viên chăm sóc
SELECT customerName, salesRepEmployeeNumber
FROM customers
WHERE salesRepEmployeeNumber IS NULL;

# Các loại chức vụ của nhân viên
SELECT DISTINCT jobTitle
FROM Employees;

# Thông tin 10 khách hàng đầu tiên hiện đang ở Pháp
SELECT *
from customers
where country = 'France'
limit 10;

# Danh sách các nhân viên có trường reportsTo chưa xác định
select *
from employees
where employees.reportsTo IS NULL;

# Danh sách các CustomerNumber đã thực hiện giao dịch
select customerNumber
from payments;

# Danh sách các đơn hàng có ngày yêu cầu vận chuyển là ‘18/1/2003’
select *
from orders
where orderDate = '2003-05-21';

# Danh sách các đơn hàng có ngày đặt trong tháng 4 năm 2005 và có trạng thái là ‘Shipped’
select *
from orders
where orderDate between '2005-04-01' and '2005-04-30'
  and status = 'Shipped';

# danh sách các sản phẩm thuộc nhóm ‘Classic Cars’
select *
from products
where productLine = 'Classic Cars';

SELECT officeCode, city, phone
FROM offices
WHERE country = 'USA'
   OR country = 'France';

# các văn phòng được đặt tại Mỹ (USA) và Pháp (France)
SELECT officeCode, city, phone
FROM offices
WHERE country IN ('USA', 'France');

-- Các sản phẩm có giá nằm trong phạm vi 90 $ và 100 $
SELECT productCode, ProductName, buyPrice
FROM products
WHERE buyPrice BETWEEN 90 AND 100
ORDER BY buyPrice DESC;

-- Nhân viên có lastname bắt đầu bằng b
SELECT employeeNumber, lastName, firstName
FROM employees
WHERE lastname LIKE 'b%';

-- Thuộc tính suy diễn
SELECT orderNumber, (priceEach * quantityOrdered) as lineTotal
FROM orderdetails;

-- Sắp xếp danh sách nhân viên theo tên và vị trí công việc
SELECT FirstName, LastName, jobtitle
FROM Employees
ORDER BY jobtitle DESC, firstname;

-- Kết hợp thông tin của nhân viên và khách hàng
SELECT customerNumber AS ID, contactLastname AS Name
FROM customers
UNION
SELECT employeeNumber AS ID, firstName AS Name
FROM employees
ORDER BY Name, ID;

-- nhóm hàng hoá có chứa từ ‘CARS’
SELECT productCode, productName, productLine
FROM products
WHERE productLine like '%CARS%';

-- 10 sản phẩm có số lượng trong kho lớn nhất
SELECT productCode, productName, quantityInStock
FROM products
ORDER BY quantityInStock DESC
LIMIT 10;

-- Các đơn hàng đã được chuyển trong khoảng thời gian từ ‘10/1/2003’ đến ‘10/3/2003’
SELECT *
FROM orders
WHERE shippedDate BETWEEN '2003-01-10' AND '2003-03-10';

-- hàm concat để nối firstname và lastname
SELECT CONCAT(contactLastname, ', ', contactFirstname) as fullname
FROM customers;

SELECT CONCAT_WS('; ', contactLastname, contactFirstname) as fullname
FROM customers;

-- sử dụng concat_ws để có được định dạng địa chỉ của khách hàng
SELECT CONCAT_WS(
               '\n',
               CONCAT_WS(' ', contactLastname, contactFirstname),
               addressLine1,
               addressLine2,
               CONCAT_WS(' ', postalCode, city),
               country
               ) AS Customer_Address
FROM customers;

-- REPLACE sửa lỗi chính tả, thay thế chuỗi trong bảng Product
UPDATE products
SET productDescription = REPLACE(productDescription,'abuot','about');

-- sử dụng IF để hiển thị trạng thái của khách hàng là N / A nếu nó là NULL
SELECT customerNumber,
       customerName,
       IF(state IS NULL,'N/A',state) as state,
       -- hoặc dùng coalesce nếu tình huống ngắn gọn
       -- COALESCE(state, 'N/A') AS state,
       country
FROM customers;

-- IF cũng rất hữu ích với chức năng tổng hợp
SELECT SUM(IF(status = 'Shipped',1,0)) AS Shipped,
       SUM(IF(status = 'Cancelled',1,0)) AS Cancelled
FROM orders;

-- hoặc đơn giản hơn
# SELECT SUM(status = 'Shipped') AS Shipped,
#        SUM(status = 'Cancelled') AS Cancelled
# FROM orders;

-- tính toán số ngày giữa ngày vận chuyển và ngày yêu cầu trong đơn đặt hàng
-- chúng ta sử dụng DATEDIFF
SELECT orderNumber,
       DATEDIFF(requiredDate,shippedDate) AS daysLeft
FROM orders
ORDER BY daysLeft;


-- Hàm ADDDATE hoặc DATE_ADD
# Ví dụ: ngày sau ngày hôm nay 30 ngày, lưu ý có thể '-30 day'
# SELECT ADDDATE(NOW(), INTERVAL 30 DAY);

-- các đơn đặt hàng trong khoảng 30 ngày tính từ ngày 1/4/2005
SET @startDate = '2005-05-01';
SELECT * FROM orders
WHERE orderDate BETWEEN @startDate AND ADDDATE(@startDate, INTERVAL 30 DAY);
SET @startDate2 = '2005-04-01';
SELECT * FROM orders
WHERE orderDate BETWEEN DATE_ADD(@startDate2, INTERVAL -1 MONTH) AND @startDate2;

-- các đơn hàng năm 2005
SELECT * FROM orders
WHERE YEAR(orderDate) = 2005;
# WHERE orderDate >= '2004-01-01' AND orderDate < '2005-01-01'
-- câu WHERE này sẽ cho hiệu năng tốt hơn

-- các đơn hàng theo từng quý năm 2004
SELECT QUARTER(orderDate) AS Quý, COUNT(*) AS 'Số đơn hàng'
FROM orders
WHERE orderDate >= '2004-01-01' AND orderDate < '2005-01-01'
GROUP BY Quý;

-- Lấy ra 50 ký tự đầu tiên của phần mô tả sản phẩm, đặt tên là ‘Title of products’
SELECT productName,
#        SUBSTRING(productDescription, 1, 50) AS 'Title of products'
       LEFT(productDescription, 50) AS 'Title of products'
FROM products;

-- Đưa ra mô tả về các nhân viên theo định dạng ‘Fullname, jobTitle.’
SELECT CONCAT(Lastname, ', ',Firstname) AS Fullname, jobtitle
FROM employees;

-- Thay thế toàn bộ tên nhóm hàng có chứa ‘Cars’ thành ‘Automobiles’
-- TH1 nếu không có ràng buộc ON UPDATE CASCADE
INSERT INTO productlines
SELECT REPLACE(productLine,'Automobiles', 'Cars' ),textDescription, htmlDescription, image
FROM productlines
WHERE productLine LIKE '%Automobiles%';

UPDATE products
SET productLine = REPLACE(productLine,'Automobiles', 'Cars')
WHERE productLine IN (SELECT productLine FROM productlines WHERE productLine LIKE '%Automobiles%');

DELETE FROM productlines WHERE productLine LIKE '%Automobiles%';

-- TH2 nếu có ràng buộc ON UPDATE CASCADE
UPDATE productlines
SET productLine = REPLACE(productLine,'Cars', 'Automobiles')
WHERE productLine LIKE '%Cars%';


-- Tìm 5 đơn hàng được vận chuyển sớm nhất so với ngày yêu cầu
SELECT orderNumber, DATEDIFF(requiredDate,shippedDate) AS daysLeft
FROM orders
ORDER BY daysLeft DESC
LIMIT 5;

-- các đơn đặt hàng trong tháng 5 năm 2005 và có ngày chuyển hàng đến chưa xác định
SELECT * FROM orders
WHERE orderDate BETWEEN '2005-05-01' AND '2005-05-31' AND shippedDate IS NULL;

