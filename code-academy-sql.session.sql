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

-- @block Return Total Order Amount by Month ( i.e Year_Month | Total_Order_Amount )
SELECT LEFT(order_date::text, 7) order_month,
SUM(total_amount) total_order_amount
FROM CodeAcademySchema.order
GROUP BY order_month
ORDER BY order_month; 

-- @block Return Total Order Amount by Month & Product (i.e Year_Month | Product_Name | Total_Order_Amount)
SELECT LEFT(order_date::text, 7) order_month,
SUM(total_amount) total_order_amount,
C.product_name product
FROM CodeAcademySchema.order A
INNER JOIN CodeAcademySchema.order_line B ON A.order_id = B.order_id
INNER JOIN CodeAcademySchema.product C ON B.product_id = C.product_id
GROUP BY order_month, product;

-- @block Return a List of Customers whose Orders than have not yet been dispatched (i.e Customer_Name | Date | Order_Amount)
SELECT A.customer_name,
B.order_date,
B.total_amount,
C.status_name
FROM CodeAcademySchema.customer A
INNER JOIN CodeAcademySchema.order B ON A.customer_id = B.customer_id
INNER JOIN CodeAcademySchema.order_status C ON B.order_status_id  = C.order_status_id
WHERE status_name = 'Unshipped';














