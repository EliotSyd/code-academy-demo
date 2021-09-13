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
WHERE order_date '2019-05-31';

-- @block Select Orders equal to or greater to £100
SELECT order_id, total_amount
FROM CodeAcademySchema.order
WHERE total_amount >= '100';

-- @block Select Orders after 31st May 2019, and equal to or greater £100
SELECT order_id, total_amount, order_date
FROM CodeAcademySchema.order
WHERE total_amount >= '100' AND order_date > '2019-05-31';



-- @block INNER JOIN 
SELECT A.customer_name
,B.total_amount
FROM CodeAcademySchema.customer A
INNER JOIN CodeAcademySchema.order B
    ON A.customer_id = B.customer_id
  LIMIT 10;

-- @block INNER JOIN 
SELECT A.customer_name,
A.customer_id,
B.order_date,
B.total_amount
FROM CodeAcademySchema.customer A
INNER JOIN CodeAcademySchema.order B ON A.customer_id = B.customer_id;

-- @block LEFT JOIN
SELECT A.customer_name,
A.customer_id,
B.order_date,
B.total_amount
FROM CodeAcademySchema.customer A
LEFT JOIN CodeAcademySchema.order B ON A.customer_id = B.customer_id;

-- @block Select number of Customers for each City
SELECT COUNT(customer_name), city
FROM CodeAcademySchema.customer
GROUP BY city; 

-- @block Select first Order date for each Customer
SELECT A.customer_name,
MIN(B.order_date) earliest_order
FROM CodeAcademySchema.customer A 
INNER JOIN CodeAcademySchema.order B ON A.customer_id = B.customer_id
GROUP BY customer_name
ORDER BY earliest_order;

-- @block Select most recent Order date for each Customer
SELECT A.customer_name,
MAX(B.order_date) most_recent_order
FROM CodeAcademySchema.customer A
INNER JOIN CodeAcademySchema.order B ON A.customer_id = B.customer_id
GROUP BY customer_name;

-- @block Select total spend for each Customers (Include customer who have never spent)
SELECT customer_name,
SUM(B.total_amount) total_spent
FROM CodeAcademySchema.customer A
LEFT JOIN CodeAcademySchema.order B ON A.customer_id = B.customer_id
GROUP BY customer_name
ORDER BY total_spent DESC;













