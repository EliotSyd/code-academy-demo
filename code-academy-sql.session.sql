-- @block  create schema 
CREATE SCHEMA CodeAcademySchema;

-- @block customer name  
SELECT customer_name
FROM CodeAcademySchema.customer;

-- @block customer name & email 
SELECT customer_name, email 
FROM  CodeAcademySchema.customer;

-- @block all customer collumns 
SELECT *
FROM CodeAcademySchema.customer;

-- @block Sort Customers by the Name in ascending order
SELECT customer_name
FROM CodeAcademySchema.customer
ORDER BY customer_name ASC;

-- @block Sort Customers by the Name in descending order
SELECT customer_name
FROM CodeAcademySchema.customer
ORDER BY customer_name DESC;

-- @block Select distinct Cities
SELECT DISTINCT city
FROM CodeAcademySchema.customer;

-- @block elect distinct Cities, sorted in ascending order
SELECT DISTINCT city
FROM CodeAcademySchema.customer
ORDER BY city;

-- @block Select Customers from Birmingham
SELECT customer_name
FROM CodeAcademySchema.customer
WHERE city = 'Birmingham'


-- @block Select Customers from Birmingham or London
SELECT customer_name
FROM CodeAcademySchema.customer
WHERE city = 'Birmingham'
OR city = 'London';

-- @block Select Customers from Birmingham or London
-- SELECT customer_name
-- FROM CodeAcademySchema.customer.             (THIS WAY ALSO WORKS)
-- WHERE city in = ('Birmingham', 'London');


-- @block Select Customers not from Birmingham
SELECT customer_name, city 
FROM CodeAcademySchema.customer
WHERE city <> 'Birmingham'; -- ALSO WORKS !=

-- @block Select Orders after 31st May 2019
SELECT order_id
FROM CodeAcademySchema.order
WHERE order_date '31-05-19';








