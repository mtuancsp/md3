-- create view customer_views as
-- select customerNumber, customerName, phone
-- from customers;

CREATE OR REPLACE VIEW customer_views AS

SELECT customerNumber, customerName, contactFirstName, contactLastName, phone

FROM customers

WHERE city = 'Nantes';

select * from customer_views;

-- DROP VIEW customer_views;