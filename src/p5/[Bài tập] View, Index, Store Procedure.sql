-- CREATE DATABASE IF NOT EXISTS demo;

-- USE demo;

-- CREATE TABLE IF NOT EXISTS Products (
-- Id INT AUTO_INCREMENT PRIMARY KEY,
-- productCode VARCHAR(50) NOT NULL,
-- productName VARCHAR(255) NOT NULL,
-- productPrice DECIMAL(10, 2) NOT NULL,
-- productAmount INT NOT NULL,
-- productDescription TEXT,
-- productStatus VARCHAR(20) DEFAULT 'Active'
-- );

-- INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
-- VALUES
--   ('P001', 'Product 1', 10.5, 50, 'Description of Product 1', 'active'),
--   ('P002', 'Product 2', 15.2, 30, 'Description of Product 2', 'inactive'),
--   ('P003', 'Product 3', 20.0, 25, 'Description of Product 3', 'active'),
--   ('P004', 'Product 4', 5.5, 80, 'Description of Product 4', 'inactive'),
--   ('P005', 'Product 5', 12.0, 40, 'Description of Product 5', 'active');
  
  -- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
-- ALTER TABLE Products ADD UNIQUE (productCode);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
-- CREATE INDEX composite_idx ON Products (productName, productPrice);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
EXPLAIN SELECT * FROM Products WHERE productCode = 'P001';


-- CREATE VIEW product_info AS
-- SELECT productCode, productName, productPrice, productStatus
-- FROM products;

ALTER VIEW product_info AS
SELECT productCode, productName, productPrice, productAmount, productStatus
FROM products;

-- DROP VIEW IF EXISTS product_info;

select * from product_info;


