USE classicmodels;


/* -------------------  SQL select & from ------------------- */
 SELECT * FROM employees;
   #returns all data from employees table
   
 SELECT firstName, lastName FROM employees;
   #returns particular columns


/*------------------- SQL Distinct ------------------- */
SELECT distinct paymentDate FROM payments;


/* -------------------  SQL WHERE -------------------  */
SELECT * FROM customers WHERE city="NYC";
#returns customers data who belongs to NYC city
   
SELECT * FROM employees WHERE firstName="Mary" AND jobTitle="VP Sales";
#returns employee data (two conditions should satisfy)
   
SELECT * FROM products WHERE quantityInStock>5000;
#returns products info whose quantity is greater than 5000

SELECT * FROM products WHERE productLine LIKE '%Cars';
#returns products info whose productline ends with Cars

SELECT * FROM offices WHERE city IN('London','Sydney','Tokyo');
#returns office address for three cities

SELECT * FROM payments WHERE amount BETWEEN 6000 AND 9000;
#returns payment information between 6000 to 9000, includes the intervals

SELECT * FROM customers WHERE NOT city='Singapore';
#returns customer information except for city Singapore

SELECT * FROM orders WHERE comments IS NULL;
#returns order info(comment column is null)


/* -------------------   SQL Aggregate functions -------------------  */
SELECT COUNT(*) FROM employees; 
#returns total number of rows (non null + null values)

SELECT COUNT(customerName) FROM customers;
#counts particular column (only non null values)

SELECT MAX(amount), MIN(amount), SUM(amount) FROM payments;
#returns maximum, minimum and total payment amount

SELECT MAX(firstName) FROM employees;
#firstname is non numerical column so returns as close alphabetically to "Y" as possible because of MAX function


/* -------------------  SQL  As (Alias) -------------------  */
SELECT MAX(amount) AS max_amount, MIN(amount) AS min_amount, SUM(amount) AS total_amount FROM payments;
#new column name (also called as aliases)


/*-------------------  SQL Order By ------------------- */
SELECT * FROM payments ORDER BY amount;
#sorts result in ascending order 

SELECT * FROM offices ORDER BY City Desc;
#sorts result in descending order by desc keyword
   
SELECT * FROM employees ORDER BY firstName, employeeNumber desc;
#first sorts the result by firstName in ascending order (A to Z) and 
#then by employeeNumber in descending order within those already sorted records


/*-------------------   SQL group by  ------------------- */
SELECT productline, sum(quantityInStock) FROM products group by productline;
#data is divided into groups (In our case it is productline) and then aggregates independently.


/*-------------------  SQL having ------------------- */
SELECT  productline, sum(quantityInStock) FROM products group by productline having sum(quantityInStock)>60000;
#Grouped data is filtered using having clause


/*-------------------  SQL limit ------------------- */
SELECT * from orders limit 5;
#returns first 5 records


/* ------------------- Join ------------------- */
SELECT c.customerName, c.phone, c.city, o.orderDate, o.status 
FROM customers AS c
LEFT JOIN 
orders AS o
ON c.customerNumber = o.customerNumber;



/* -------------------  Final  Query  -------------------*/
SELECT productLine, sum(QuantityInStock)
FROM products
WHERE buyPrice>50
GROUP BY productLine
HAVING sum(QuantityInStock)>50000

