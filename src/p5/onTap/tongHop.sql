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
SET productDescription = REPLACE(productDescription, 'abuot', 'about');

-- sử dụng IF để hiển thị trạng thái của khách hàng là N / A nếu nó là NULL
SELECT customerNumber,
       customerName,
       IF(state IS NULL, 'N/A', state) as state,
       -- hoặc dùng coalesce nếu tình huống ngắn gọn
       -- COALESCE(state, 'N/A') AS state,
       country
FROM customers;

-- IF cũng rất hữu ích với chức năng tổng hợp
SELECT SUM(IF(status = 'Shipped', 1, 0))   AS Shipped,
       SUM(IF(status = 'Cancelled', 1, 0)) AS Cancelled
FROM orders;

-- hoặc đơn giản hơn
SELECT SUM(status = 'Shipped') AS Shipped,
       SUM(status = 'Cancelled') AS Cancelled
FROM orders;

-- tính toán số ngày giữa ngày vận chuyển và ngày yêu cầu trong đơn đặt hàng
-- chúng ta sử dụng DATEDIFF
SELECT orderNumber,
       DATEDIFF(requiredDate, shippedDate) AS daysLeft
FROM orders
ORDER BY daysLeft;


-- Hàm ADDDATE hoặc DATE_ADD
# Ví dụ: ngày sau ngày hôm nay 30 ngày, lưu ý có thể '-30 day'
# SELECT ADDDATE(NOW(), INTERVAL 30 DAY);

-- các đơn đặt hàng trong khoảng 30 ngày tính từ ngày 1/4/2005
SET @startDate = '2005-05-01';
SELECT *
FROM orders
WHERE orderDate BETWEEN @startDate AND ADDDATE(@startDate, INTERVAL 30 DAY);
SET @startDate2 = '2005-04-01';
SELECT *
FROM orders
WHERE orderDate BETWEEN DATE_ADD(@startDate2, INTERVAL -1 MONTH) AND @startDate2;

-- các đơn hàng năm 2004
SELECT *
FROM orders
# WHERE YEAR(orderDate) = 2004;
WHERE orderDate >= '2004-01-01' AND orderDate < '2005-01-01';
-- câu WHERE này sẽ cho hiệu năng tốt hơn

-- các đơn hàng theo từng quý năm 2004
SELECT QUARTER(orderDate) AS Quý, COUNT(*) AS 'Số đơn hàng'
FROM orders
WHERE orderDate >= '2004-01-01'
  AND orderDate < '2005-01-01'
GROUP BY Quý;

-- Lấy ra 50 ký tự đầu tiên của phần mô tả sản phẩm, đặt tên là ‘Title of products’
SELECT productName,
#        SUBSTRING(productDescription, 1, 50) AS 'Title of products'
       LEFT(productDescription, 50) AS 'Title of products'
FROM products;

-- Đưa ra mô tả về các nhân viên theo định dạng ‘Fullname, jobTitle.’
SELECT CONCAT(Lastname, ', ', Firstname) AS Fullname, jobtitle
FROM employees;

-- Thay thế toàn bộ tên nhóm hàng có chứa ‘Cars’ thành ‘Automobiles’
-- TH1 nếu không có ràng buộc ON UPDATE CASCADE
INSERT INTO productlines
SELECT REPLACE(productLine, 'Automobiles', 'Cars'), textDescription, htmlDescription, image
FROM productlines
WHERE productLine LIKE '%Automobiles%';

UPDATE products
SET productLine = REPLACE(productLine, 'Automobiles', 'Cars')
WHERE productLine IN (SELECT productLine FROM productlines WHERE productLine LIKE '%Automobiles%');

DELETE
FROM productlines
WHERE productLine LIKE '%Automobiles%';

-- TH2 nếu có ràng buộc ON UPDATE CASCADE
UPDATE productlines
SET productLine = REPLACE(productLine, 'Cars', 'Automobiles')
WHERE productLine LIKE '%Cars%';


-- Tìm 5 đơn hàng được vận chuyển sớm nhất so với ngày yêu cầu
SELECT orderNumber, DATEDIFF(requiredDate, shippedDate) AS daysLeft
FROM orders
ORDER BY daysLeft DESC
LIMIT 5;

-- các đơn đặt hàng trong tháng 5 năm 2005 và có ngày chuyển hàng đến chưa xác định
SELECT *
FROM orders
WHERE orderDate BETWEEN '2005-05-01' AND '2005-05-31'
  AND shippedDate IS NULL;

-- tổng số tiền đã thu được
SELECT sum(priceEach * quantityOrdered) total
FROM orderdetails;

--  mức giá cao nhất và mức giá nhỏ nhất của sản phẩm
SELECT MAX(buyPrice) as highest_price,
       MIN(buyPrice) as lowest_price
FROM Products;

-- số đơn đặt hàng trong từng trạng thái
SELECT status, count(*)
FROM orders
GROUP BY status;

-- Số loại sản phẩm trong mỗi loại dòng sản phẩm
SELECT productLine, count(*)
FROM products
GROUP BY productline;

-- Tổng số tiền thu được từ mỗi dòng sản phẩm
SELECT o.productCode, productName, sum(priceEach * quantityOrdered) total
FROM orderdetails as o
         join products p on p.productCode = o.productCode
GROUP by productCode
ORDER BY total DESC;

-- Những đơn hàng trên $40,000
SELECT ordernumber,
       sum(quantityOrdered)             AS itemsCount,
       sum(priceEach * quantityOrdered) AS total
FROM orderdetails
GROUP BY ordernumber
HAVING total > 40000;

-- Lượng khách hàng tại từng thành phố
SELECT city, count(customerNumber) as customerCount
FROM customers
GROUP BY city
HAVING customerCount > 1;

-- Tổng giá trị các đơn hàng của các khách hàng
SELECT C.customerName,
       sum(OD.priceEach * OD.quantityOrdered)
           as total
FROM customers C
         JOIN orders O on C.customerNumber = O.customerNumber
         JOIN orderdetails OD on O.orderNumber =
                                 OD.orderNumber
GROUP BY C.customerName
HAVING total > 100000
ORDER BY total DESC;

-- Các khách hàng không đặt đơn hàng nào
SELECT c.customerNumber, customerName
FROM customers c
         LEFT JOIN orders o ON c.customerNumber = o.customerNumber
WHERE orderNumber is NULL;

-- (Self Join) khi một bảng có khóa ngoài tham chiếu tới khóa chính của chính nó
-- Ví dụ: Bảng employees có một khóa ngoài là reportsTo tham chiếu tới khóa chính employeeNumber của chính bảng employees
SELECT concat(e1.lastName, ' ', e1.firstName) as fullname,
       e1.email,
       concat(e2.lastName, ' ', e2.firstName) as manager,
       e2.email                               as manager_email
FROM employees e1 JOIN employees e2 ON e1.reportsTo = e2.employeeNumber;
-- hoặc có thể viết
SELECT concat(e1.lastName, ' ', e1.firstName) as fullname,
       e1.email,
       concat(e2.lastName, ' ', e2.firstName) as manager,
       e2.email                               as manager_email
FROM employees e1,
     employees e2
WHERE e1.reportsTo = e2.employeeNumber;

-- thông tin về các nhân viên và tên văn phòng nơi họ làm việc
select concat(e.lastName, ' ', e.firstName) as fullname, o.city as office
from employees e
         join offices o on o.officeCode = e.officeCode;

-- tên khách hàng và tên các sản phẩm họ đã mua
select c.customerName, p.productName
from customers c
         join orders o on c.customerNumber = o.customerNumber
         join orderdetails od on o.orderNumber = od.orderNumber
         join products p on od.productCode = p.productCode;

-- các mặt hàng chưa có ai đặt mua
select p.productName, od.orderNumber
from products p
         left join orderdetails od on p.productCode = od.productCode
where od.orderNumber is null;

-- các đơn hàng trong tháng 3/2005 (gồm orderDate, requiredDate, Status) và tổng giá trị của mỗi đơn hàng
select o.orderNumber, o.orderDate, o.requiredDate, o.status, sum(od.priceEach * od.quantityOrdered) as total
from orders o
         join orderdetails od on o.orderNumber = od.orderNumber
where o.orderDate between '2005-03-01' and '2005-03-31'
group by o.orderNumber;

-- thông tin về các dòng sản phẩm và số lượng sản phẩm của dòng sản phẩm đó
select productName,
       quantityInStock,
       COALESCE(quantityOrdered, 0)                     AS quantityOrdered,
       (quantityInStock + COALESCE(quantityOrdered, 0)) as total
from products p
         left join orderdetails od on p.productCode = od.productCode
order by total desc;

-- Đưa ra các đơn hàng gần đây nhất
SELECT *
FROM orders
WHERE orderDate = (SELECT MAX(orderDate) FROM orders);

-- các sản phẩm không có mặt trong bất kỳ đơn hàng nào
SELECT *
FROM products
WHERE productCode NOT IN (SELECT productCode FROM orderdetails);


-- các sản phẩm có số lượng trong kho lớn hơn trung bình
SELECT *
FROM products p
WHERE quantityInStock >
      (SELECt avg(quantityInStock)
       FROM products);

-- với mỗi dòng đơn hàng, đưa vào thêm tên của sản phẩm
SELECT orderNumber,
       quantityOrdered,
       (SELECT productName
        FROM products
        WHERE productCode =
              o.productCode) as productName
FROM orderdetails o;
--  tương đương với
SELECT orderNumber, quantityOrdered, productName
FROM orderdetails o
         JOIN products p on o.productCode = p.productCode;

-- với mỗi sản phẩm, đưa kèm thêm tổng số lượng sản phẩm đó đã được đặt hàng
SELECT productName,
       (SELECT sum(quantityOrdered)
        FROM orderdetails
        WHERE productCode = p.productCode) as totalQuantityOrderd
FROM products as p
ORDER BY totalQuantityOrderd desc;

-- Các sản phẩm có đơn đặt hàng trong tháng 3/2005
SELECT productName
FROM products
WHERE productCode IN (SELECT productCode
                      FROM orderdetails
                      WHERE orderNumber IN (SELECT orderNumber
                                            FROM orders
                                            WHERE orderDate BETWEEN '2005-03-01' AND '2005-03-31'));
-- dùng join
SELECT p.productName
FROM products AS p
         JOIN orderdetails AS od using (productCode)
         JOIN orders AS o using (orderNumber)
WHERE o.orderDate BETWEEN '2005-03-01' AND '2005-03-31';

-- information about orders in the last month
SELECT *
FROM orders
WHERE orderDate >= (select DATE_ADD(MAX(orderDate), INTERVAL -1 MONTH) from orders);

-- Use a subquery that gives information about orders and total order value
select *,
       (select sum(priceEach * quantityOrdered)
        from orderdetails
        where orderNumber = o.orderNumber) as totalOrderValue
from orders o;

-- For each customer, give the total amount of the goods, and the total amount they paid
SELECT c.customerName,
       SUM(od.priceEach * od.quantityOrdered) AS totalOrderValue,
       SUM(p.amount)                          AS totalPayment
FROM customers c
         JOIN orders o USING (customerNumber)
         JOIN orderdetails od USING (orderNumber)
         JOIN payments p USING (customerNumber)
GROUP BY c.customerName;

-- cập nhật email của Diane Murphy với employeeNumber là 1002 thành diane-murphy@classicmodelcars.com
UPDATE employees
SET email = 'diane-murphy@classicmodelcars.com'
WHERE employeeNumber = 1002;

SELECT firstname,
       lastname,
       email
FROM employees
WHERE employeeNumber = 1002;

-- Sửa các nhân viên có titleJob là ‘Sales Rep’ thành ‘Sales Representative’
UPDATE employees
SET jobTitle = 'Sales Representative'
WHERE jobTitle = 'Sales Rep';

-- Create a table named temp_orderDetails, then do more data in the most recent date from the orderdetails table to the temp table
DROP TABLE temp_orderdetails;

CREATE TABLE IF NOT EXISTS temp_orderDetails AS
SELECT od.*
FROM orderdetails od
         JOIN (
    SELECT orderNumber
    FROM orders
    WHERE orderDate = (SELECT MAX(orderDate) FROM orders)
) o ON od.orderNumber = o.orderNumber;

SELECT * FROM temp_orderDetails;

-- index
EXPLAIN SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.';

ALTER TABLE customers ADD INDEX idx_customerName(customerName);
EXPLAIN SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.';

ALTER TABLE customers DROP INDEX idx_customerName;

ALTER TABLE customers ADD INDEX idx_full_name(contactFirstName, contactLastName);
EXPLAIN SELECT * FROM customers WHERE contactFirstName = 'Jean' or contactFirstName = 'King';

ALTER TABLE customers DROP INDEX idx_full_name;

