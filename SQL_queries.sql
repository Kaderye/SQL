-- Show the user name
SHOW user;
--====================================================================================================================

-- Show all the table_name of user
SELECT table_name
  FROM user_tables;

--====================================================================================================================
-- CHAPTER - SELECT

-- Show the all records of the table is customers
SELECT
    * FROM customers;
    
-- print the customerName and City from customers
SELECT customername,city 
FROM customers;

--====================================================================================================================
-- CHAPTER - SELECT DISTINCE

-- select all the different countries from the customers table
SELECT DISTINCT country 
FROM customers;

-- select all the countries from the customers table
SELECT country 
FROM customers;

-- what is the total number of country using DISTINCT() function 
SELECT COUNT(DISTINCT country) 
FROM customers;

SELECT COUNT(*) Total_Country 
FROM (SELECT DISTINCT country 
FROM customers);

-- what is the total number of countres in customers table
SELECT COUNT(country) 
FROM customers;

--====================================================================================================================
-- CHAPTER - WHERE

-- select all customers from Mexico
SELECT customername
FROM customers
WHERE country='Mexico';

SELECT
    * FROM customers
    WHERE country='Mexico';

--show all information with customerid is 1    
SELECT
    * FROM customers
    WHERE customerid=1;
    
-- select all customers with a customerid greater than 80
SELECT
    * FROM customers
    WHERE customerid >80;
    
-- select all customers with a customerid greater than or equal 80
SELECT
    * FROM customers
    WHERE customerid>=80;
    
-- select all customers with a customerid less than 20
SELECT
    * FROM customers
    WHERE customerid<20;

-- select all customers with a customerid less than or equal 20
SELECT
    * FROM customers
    WHERE customerid<=20;
    
-- select all customers with a customerid not equal 2
SELECT
    * FROM customers
    WHERE customerid != 2;
    
--====================================================================================================================
-- CHAPTER - ORDER BY

-- sort the products by price
SELECT
    * FROM products
    ORDER BY price;
    
-- sort the products from highest to lowest price
SELECT
    * FROM products
    ORDER BY price DESC;
    
-- sort the products alphabetically by productName
SELECT
    * FROM products
    ORDER BY productname;
    
-- sort the products by productName in reverse order
SELECT
    * FROM products
    ORDER BY productname DESC; 
    
-- select all customers from the customers table, sorted by the country and the customerName
SELECT
    * FROM customers
    ORDER BY country,customername;
    
-- selects all customers from the customers table, sorted ascending by the country and descending by the customerName
SELECT
    * FROM customers
    ORDER BY country ASC, customername DESC;

--====================================================================================================================
-- CHAPTER - AND

-- select all customers from Spain that starts with the letter 'G'
SELECT
    * FROM customers
    WHERE country='Spain'
    AND customername LIKE 'G%';
    
-- selects all fields from customers table where country is Germany and City is Berlin and postalCode is higher than 12000
SELECT
    * FROM customers
    WHERE country='Germany'
    AND city='Berlin'
    AND postalcode>12000;
    
-- select all Spanish customers that starts with either 'G' or 'R'
SELECT
    * FROM customers
    WHERE country='Spain'
    AND (customername LIKE 'G%' OR customername LIKE 'R%');

-- select all customers that either: are from Spain and starts with either G or starts with R 
SELECT
    * FROM customers
    WHERE country='Spain'
    AND customername LIKE 'G%'
    OR customername LIKE 'R%';
    
--====================================================================================================================
-- CHAPTER - OR

-- select all customers from Germany or Spain
SELECT
    * FROM customers
    WHERE country='Germany'
    OR country='Spain';

-- selects all fields from customers table where either city is Berlin, customerName starts with the letter G or country is Norway
SELECT
    * FROM customers
    WHERE city='Berlin'
    OR customername LIKE 'G%'
    OR country='Norway';

-- select all Spanish customers that starts with either G or R
SELECT
    * FROM customers
    WHERE country='Spain'
    AND (customername LIKE 'G%'
    OR customername LIKE 'R%');

-- select all customers that either: are from Spain and starts with either G, or starts with R
SELECT
    * FROM customers
    WHERE country='Spain'
    AND customername LIKE 'G%'
    OR customername LIKE 'R%';

--====================================================================================================================
-- CHAPTER - NOT

-- select only the customers that are not from Spain
SELECT
    * FROM customers
    WHERE NOT country='Spain';

-- select customers that does not start with the letter A
SELECT
    * FROM customers
    WHERE customername NOT LIKE 'A%';
    
-- select customers with a customerid not between 10 and 60
SELECT
    * FROM customers
    WHERE customerid NOT BETWEEN 10 AND 60;

-- select customers that are not from Paris or London
SELECT
    * FROM customers
    WHERE city NOT IN('Paris','London');

-- select customers with a customerid not greater than 50
SELECT
    * FROM customers
    WHERE customerid <50;
    
SELECT
    * FROM customers
    WHERE NOT customerid>50;

--====================================================================================================================
-- CHAPTER - INSERT INTO

-- insert a new record in customers table
INSERT INTO customers 
VALUES(92,'Cardinal','Tom B. Erichsen','Skagen 21','Stavanger','4006','Norway');

-- check the new record after insert
SELECT
    * FROM customers;
    
-- insert multiple record
INSERT INTO customers
VALUES
(93,'Greasy Burger', 'Per Olsen', 'Gateveien 15', 'Sandnes', '4306', 'Norway');
INSERT INTO customers
VALUES
(94,'Tasty Tee', 'Finn Egan', 'Streetroad 19B', 'Liverpool', 'L1 0AA', 'UK');

-- insert a record as a user defined
INSERT INTO customers
VALUES('&customerid','&cutomername','&contactname','&address','&city','&postalcode','&country');

--====================================================================================================================
-- CHAPTER - NULL VALUE

-- show the list of all customers with a NULL value in the Address field
SELECT
    * FROM customers
    WHERE address IS NULL;

-- show the list of all customers with a value in the Address field
SELECT
    * FROM customers
    WHERE address IS NOT NULL;
    
--====================================================================================================================
-- CHAPTER - UPDATE

-- updates the first customer with a new contact person and a new city
UPDATE customers
SET contactname='Alfred Schmidt',city='Frankfurt'
WHERE customerid=1;

-- check the contactName for all records where country is Mexico
SELECT
    * FROM customers
    WHERE country='Mexico';

-- update the contactName to Juan for all records where country is Mexico   
UPDATE customers
SET contactname='Juan'
WHERE country='Mexico';

Note: Be careful when updating records. If you omit the WHERE clause, all records will be updated.

--====================================================================================================================
-- CHAPTER - DELETE

-- delete the customer 'Alfreds Futterkiste' from the customers tbale
DELETE FROM customers
WHERE contactname='type the contactname';

--  delete all records
DELETE FROM table_name;

--====================================================================================================================
-- CHAPTER - SELECT TOP

-- show the top 5 rows from the table is customers
SELECT
    * FROM customers
    FETCH FIRST 5 ROWS ONLY;

-- show the fifty percent from the table is customers
SELECT
    * FROM customers
    FETCH FIRST 50 PERCENT ROWS ONLY;

--selects the first three records from the customers table, where the country is Germany
SELECT
    * FROM customers
    WHERE country='Germany'
    FETCH FIRST 5 ROWS ONLY;
    
-- show the top three records where contactname is decending
SELECT
    * FROM customers
    ORDER BY customername DESC
    FETCH FIRST 3 ROWS ONLY;

--====================================================================================================================
-- CHAPTER - AGGRREGATE FUNCTIONS

-- MAX() AND MIN() FUNCTIONS

-- find the lowest price in the table of products
SELECT MIN(price)
FROM products;

SELECT MIN(price) Lowest_Price
FROM products;

-- find the highest price in the table of products
SELECT MAX(price)
FROM products;

SELECT MAX(price) Highest_Price
FROM products;

SELECT
    * FROM products;
    
-- find the smallest price for each category in the products table
SELECT categoryid, MIN(price) lowest_price
FROM products
GROUP BY categoryid;

-- find the smallest price for each productname in the products table
SELECT productname, MIN(price) AS lowest_price
FROM products
GROUP BY productname;

-- find the highest price for each category in descending format based on price in the products table
SELECT categoryid, MAX(price) "Highest Price"
FROM products
GROUP BY categoryid
ORDER BY MAX(price);

-- find the highest price for each productname in descending format based on price in the products table
SELECT productname, MAX(price) "Highest Price"
FROM products
GROUP BY productname
ORDER BY MAX(price) DESC;

-- COUNT() FUNCTION

-- find the total number of rows in the products table
SELECT COUNT(*) total_rows
FROM products;

-- find the number of products where the productname is not null
SELECT COUNT(productname) "number of products"
FROM products;

-- find the number of products where price is higher than 20
SELECT COUNT(productid)
FROM products
WHERE price>20;

-- how many different prices are there in the products table
SELECT COUNT(DISTINCT price)
FROM products;

-- show the different prices in the products table
SELECT DISTINCT price
FROM products;

-- how many different products are there in the products table
SELECT COUNT(DISTINCT productname)
FROM products;

-- show the differnt productnames in the products table
SELECT DISTINCT productname
FROM products;

-- find the number of records for each category in the products table
SELECT categoryid, COUNT(*) "number of records"
FROM products
GROUP BY categoryid
ORDER BY COUNT(*) DESC;

-- SUM() FUNCTION

SELECT 
    *FROM orderdetails;

-- return the sum of all quantity fields in the orderdetails table
SELECT SUM(quantity) "total number of quantity"
FROM orderdetails;

-- return the sum of the quantity field for the product with productid 11
SELECT SUM(quantity)
FROM orderdetails
WHERE productid=11;

-- return the sum of the quantity field for the productid using user input
SELECT SUM(quantity)
FROM orderdetails
WHERE productid='&productid';

-- give the summarized column a name by using the AS keyword
SELECT SUM(quantity) as total
FROM orderdetails;

-- return the quantity for each orderid in the orderdetails table
SELECT orderid, SUM(quantity) "Total Quantity"
FROM orderdetails
GROUP BY orderid;
--ORDER BY SUM(quantity) DESC;

-- if the price is 10 dollars of each product then find the total earnings in dollars by multiply each quantity with 10
SELECT SUM(quantity*10)
FROM orderdetails;

-- join orderdetails table with products table, and use SUM()  to find the total amount
SELECT SUM(price*quantity)
FROM orderdetails RIGHT JOIN products
ON orderdetails.productid=products.productid;

SELECT SUM(price*quantity)
FROM orderdetails, products
WHERE orderdetails.productid=products.productid;

-- AVG() FUNCTION

-- find the average price of all products
SELECT AVG(price)
FROM products;      -- here NULL value are ignored

SELECT ROUND(AVG(price),4)
FROM products;

-- return the average price of products in category 1
SELECT AVG(price)
FROM products
WHERE categoryid=1;

-- return all products with a higher price than the average price
SELECT AVG(price)
FROM products;

SELECT price
FROM products;

SELECT productname, price
FROM products
WHERE price > (SELECT AVG(price) FROM products);

-- return the average price for each category in the products table
SELECT categoryid, ROUND(AVG(price),4)
FROM products
GROUP BY categoryid;

--====================================================================================================================
-- CHAPTER - LIKE

select *from customers;

-- select all customers that starts with the letter 'a'
SELECT *
FROM customers
WHERE customername LIKE 'A%';

-- select all customers that starts with the letter L..nd..
SELECT
    *FROM customers
    WHERE city  LIKE 'L%nd%';

-- return all customers from a city that contains the letter L
SELECT
    * FROM customers
    WHERE city LIKE 'L%';

-- return all customers that starts with La
SELECT
    *FROM customers
    WHERE customername LIKE 'La%';

-- return all customers that starts with A or starts with B
SELECT
    *FROM customers
    WHERE customername LIKE 'A%'
    OR customername LIKE 'B%';

-- return all customers that ends with a
SELECT
    *FROM customers
    WHERE customername LIKE '%a';

-- return all customers that starts with B and ends with s
SELECT
    *FROM customers
    WHERE customername LIKE 'B%s';

-- return all customers that contains the phrase or
SELECT
    *FROM customers
    WHERE customername LIKE '%or%';

-- return all customers that have a in the third position
SELECT
    *FROM customers
    WHERE customername LIKE '__a%';

-- return all customers from Spain
SELECT
    *FROM customers
    WHERE country LIKE 'Spain';

--====================================================================================================================
-- CHAPTER - WILDCARDS
-- A wildcard character is used to substitute one or more characters in a string.

-- The % wildcard represents any number of characters, even zero characters.

-- return all customers that starts with the letter A
SELECT
    *FROM customers
    WHERE customername LIKE 'A%';

-- return all customers that ends with the pattern 'es'
SELECT
    * FROM customers
    WHERE customername LIKE '%es';
    
-- return all customers that contains the pattern 'mer'
SELECT
    * FROM customers
    WHERE customername LIKE '%mer%';

-- The _ wildcard represents a single character

-- return all customers with a city starting with any character, folled by 'ondon'
SELECT
    * FROM customers
    WHERE city LIKE '_ondon';
    
-- return all customers with a city starting with L, folled by any 3 characters, ending with 'on'
SELECT
    * FROM customers
    WHERE city LIKE 'L___on';

-- The [] wildcard returns a result if any of the characters inside gets a match

-- return all customers starting with either b, s, p;
SELECT
    * FROM customers
    WHERE customername '[b]%';

-- return all customers that have 'r' in the second position
SELECT
    * FROM customers
    WHERE customername LIKE '_r%';

-- return all customers from Spain
SELECT
    * FROM customers
    wHERE country LIKE 'Spain';

--====================================================================================================================
-- CHAPTER - IN OPERATOR

SELECT
    *FROM customers;

-- Return all customers from Germany, France or UK
SELECT
    * FROM customers
    WHERE country IN ('Germany','France','UK')
    ORDER BY country ASC;

-- Return all customers that are not from Germany, France or UK
SELECT customerid, customername,country
FROM customers
WHERE country NOT IN ('Germany','France','UK')
ORDER BY country ASC;

-- Return all customers that have an order in orders table
SELECT
    * FROM customers
    WHERE customerid IN (SELECT customerid FROM orders);

-- Return all customers that have not placed any orders in the orders table
SELECT
    * FROM customers
    WHERE customerid NOT IN (SELECT customerid FROM orders);

--====================================================================================================================
-- CHAPTER - BETWEEN OPERATOR

SELECT
    * FROM products;

-- Select all products with a price between 10 and 20
SELECT
    * FROM products
    WHERE price BETWEEN 10 AND 20
    ORDER BY price;

-- To display the products outside the range of the previous example
SELECT
    * FROM products
    WHERE price NOT BETWEEN 10 AND 20
    ORDER BY price;

-- selects all products with a price between 10 and 20 that the categroyid must be 1,2 or 3
SELECT
    * FROM products
    WHERE price BETWEEN 10 AND 20
    AND categoryid IN (1,2,3)
    ORDER BY categoryid;

-- selects all products with a productName alphabetically between Carnarvon Tigers and Mozzarella di Giovanni
SELECT
    * FROM products
    WHERE productname BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
    ORDER BY productname;

-- selects all products with a productName between Carnarvon Tigers and Chef Anton's Cajun Seasoning
SELECT
    * FROM products
    WHERE productname BETWEEN 'Carnarvon Tigers' AND 'Chef Anton''s Cajun Seasoning'
    ORDER BY productname;

-- selects all products with productName not between Carnarvon Tigers and Mozzarella di Giovanni
SELECT
    * FROM products
    WHERE productname NOT BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
    ORDER BY productname;

-- selects all orders with an orderDate between '01-July-1996' and '31-July-1996'
SELECT
    * FROM orders
    WHERE orderdate BETWEEN '01-July-1996' AND '31-July-1996'
    ORDER BY orderdate;

--====================================================================================================================
-- CHAPTER - SQL ALIASES

SELECT customerid AS ID
FROM customers;

SELECT customername Name
FROM customers;

SELECT customername Full_Name
FROM customers;

SELECT customername "Full Name"
FROM customers;

-- creates two aliases, one for customerid and one for the customername
SELECT customerid ID_NUMBER, customername "Full Name"
FROM customers;

-- using aliases with a space character
SELECT ProductName AS "My Great Products"
FROM Products
ORDER BY productname;

-- create alias named "Address" that combine Address, PostalCode, City and Country
SELECT customername, address||','||postalcode||','||city||','||country AS Address
FROM customers;

-- create alias for a table
SELECT
    * FROM customers persons;

-- selects all orders from the customer with customerid=4, create aliases c for customers and o for orders
SELECT o.orderid, o.orderdate, c.customername
FROM customers c, orders o
WHERE c.customerid=4 AND c.customerid=o.customerid;

--====================================================================================================================
-- CHAPTER - SQL JOINS

-- INNER JOIN: returns records that have matching values in both tables
-- LEFT (OUTER) JOIN: returns all records from the left table, and the matched records from the right table
-- RIGHT (OUTER) JOIN: retruns all records from the right table, and the matched records from the left table
-- FULL (OUTER) JOIN: returns all records when there is a match in either left or right table

SELECT o.orderid, c.customername, o.orderdate
FROM orders o, customers c
WHERE o.customerid=c.customerid;

-- create INNER JOIN between orders and customers 
SELECT o.orderid, c.customername, o.orderdate
FROM orders o INNER JOIN customers c
ON o.customerid=c.customerid;

--====================================================================================================================
-- CHAPTER - INNER JOIN

-- JOIN and INNER JOIN will retrun the same result

-- join products and categories with the INNER JOIN keyword
SELECT
    * FROM products INNER JOIN categories
    ON products.categoryid=categories.categoryid;

SELECT productid, productname, categoryname
FROM products
INNER JOIN categories
ON products.categoryid=categories.categoryid;

-- specify the table names
SELECT p.productid, p.productname, c.categoryname
FROM products p
INNER JOIN categories c
ON c.categoryid=p.categoryid;

-- selects all orders with customer and shipper information
SELECT o.orderid, c.customername, s.shippername
FROM ((orders o
INNER JOIN customers c
ON o.customerid=c.customerid)
INNER JOIN shippers s
ON o.shipperid=s.shipperid);

--====================================================================================================================
-- CHAPTER - LEFT (OUTER) JOIN

-- select all customers and any orders they might have
SELECT c.customername, o.orderid
FROM customers c
LEFT JOIN orders o
ON c.customerid=o.customerid;

-- select all customers and any orders they might have NULL
SELECT c.customername, o.orderid
FROM customers c
LEFT JOIN orders o
ON c.customerid=o.customerid
WHERE o.orderid IS NULL;

--====================================================================================================================
-- CHAPTER - RIGHT (OUTER) JOIN

-- return all employees and any orders they might have placed
SELECT o.orderid, o.orderdate, e.firstname||' '||e.lastname "Employee Name"
FROM orders o
RIGHT JOIN employees e
ON o.employeeid=e.employeeid
ORDER BY o.orderid;

-- return all employees and any orders they might have placed in July 1996
SELECT o.orderid, o.orderdate, e.firstname||' '||e.lastname "Employee Name"
FROM orders o
RIGHT JOIN employees e
ON o.employeeid=e.employeeid
WHERE o.orderdate BETWEEN '01-July-96' AND '31-July-96';

--====================================================================================================================
-- CHAPTER - FULL (OUTER) JOIN

-- select all customers and all orders
SELECT
    * FROM customers c
    FULL OUTER JOIN orders o
    ON c.customerid=o.customerid;

SELECT c.customername, o.orderid
FROM customers c
FULL JOIN orders o
ON c.customerid=o.customerid
ORDER BY c.customername ASC;

SELECT c.customername, o.orderid
FROM customers c
FULL JOIN orders o
ON c.customerid=o.customerid
WHERE o.orderid IS NULL;

--====================================================================================================================
-- CHAPTER - SELF JOIN

-- a self join is a regular join, but the table is joined with itself

SELECT A.customername, B.City
FROM customers A, customers B
WHERE A.customerid=B.customerid
AND A.city=B.City
ORDER BY A.customername;

--====================================================================================================================
-- CHAPTER - UNION OPERATOR

-- The UNION operator is used to combine the result set of two or more SELECT statement
-- The UNION ALL operator selects only distinct values by default. To allow duplicate values

-- return the cities (only distinct values) from both the customers and the suppliers table
SELECT city
FROM customers
UNION
SELECT city
FROM suppliers
ORDER BY city;

-- return the cities (duplicate values also) from both the customers and the suppliers
SELECT city
FROM customers
UNION ALL
SELECT city
FROM suppliers
ORDER BY city;

-- return the German cities (only distinct values) from both the customers and the suppliers
SELECT customers.city,customers.country
FROM customers
WHERE country='Germany'
UNION
SELECT suppliers.city,suppliers.country
FROM suppliers
WHERE country='Germany'
ORDER BY city;

-- return the German cities (duplicate values also) from both the customers and the suppliers table
SELECT customers.city,customers.country
FROM customers
WHERE country='Germany'
UNION ALL
SELECT suppliers.city,suppliers.country
FROM suppliers
WHERE country='Germany'
ORDER BY city;

-- return all customers and suppliers in a list
SELECT 'customer' AS Type, contactname, city, country
FROM customers
UNION
SELECT 'supplier' AS Type, contactname, city, country
FROM suppliers;

--====================================================================================================================
-- CHAPTER - GROUP BY

-- aggregate functions: count(), max(), min(), sum(), avg()

-- return the number of cusotmers in each country
SELECT country, count(customerid) as "Number of customers"
FROM customers
GROUP BY country
ORDER BY "Number of customers" DESC;

-- print the number of orders send by each shipper   
SELECT s.shippername, count(o.orderid) "Number of orders"
FROM orders o, shippers s
WHERE o.shipperid=s.shipperid
GROUP BY s.shippername
ORDER BY "Number of orders" DESC;

SELECT s.shippername, count(o.orderid) "Number of orderid"
FROM orders o
LEFT JOIN shippers s
ON o.shipperid=s.shipperid
GROUP BY s.shippername
ORDER BY "Number of orderid" DESC;

--====================================================================================================================
-- CHAPTER - HAVING

-- print the number of customers in each country with more than 5 cusotmers
SELECT c.country, count(c.customerid) "Number of customers"
FROM customers c
GROUP BY c.country
HAVING count(c.customerid) > 5
ORDER BY "Number of customers" DESC;

--====================================================================================================================
-- CHAPTER - EXITS OPERATOR

-- The EXISTS operator is used to test for the existence of any record in a subquery
-- The EXISTS operator returns TRUE if the subquery returns one or more records

-- return the lists of suppliers with a product price less than 20
SELECT s.suppliername
FROM suppliers s
WHERE EXISTS
(SELECT p.productname FROM products p WHERE p.supplierid=s.supplierid AND price <20);

-- another way
SELECT DISTINCT s.suppliername
FROM suppliers s
LEFT JOIN products p
ON s.supplierid=p.supplierid
WHERE p.price <20
ORDER BY s.suppliername;

-- return the lists of suppliers with a product price is equal to 22
SELECT DISTINCT s.suppliername
FROM suppliers s
LEFT JOIN products p
ON s.supplierid=p.supplierid
WHERE p.price = 22
ORDER BY s.suppliername;

--====================================================================================================================
-- CHAPTER - ANY and ALL OPERATOR

-- print the list of productnames if it finds ANY records in the orderdetails table has quantity equal to 10
SELECT DISTINCT p.productname
FROM products p
LEFT JOIN orderdetails od
ON p.productid = od.productid
WHERE od.quantity= 10
ORDER BY p.productname;

-- another way : use ANY OPERATOR
SELECT productname
FROM products
WHERE productid = ANY(SELECT productid FROM orderdetails WHERE quantity=10)
ORDER BY productname;

-- print the list of productname if it finds ANY records in the orderdetails table has quantity larger than 99
SELECT DISTINCT p.productname
FROM products p, orderdetails od
WHERE p.productid = od.productid
AND od.quantity > 99
ORDER BY p.productname;

-- another way : use ANY operator
SELECT productname
FROM products
WHERE productid = ANY(SELECT productid FROM orderdetails WHERE quantity > 99);

-- print the list of productname if it finds ANY records in the orderdetails table has quantity larger than 1000
SELECT DISTINCT p.productname
FROM products p, orderdetails od
WHERE p.productid = od.productid
AND od.quantity > 1000
ORDER BY p.productname;

-- another way : use ANY operator
SELECT productname
FROM products
WHERE productid = ANY(SELECT productid FROM orderdetails WHERE quantity > 1000);

-- print the list of all the productnames
SELECT ALL productname
FROM products;

--====================================================================================================================
-- CHAPTER - CASE

-- follow the conditions and returns a value when the first condition is met
SELECT orderid, quantity,
CASE WHEN quantity > 30 THEN 'The quantity is greather than 30'
WHEN quantity = 30 THEN 'The quantity is equal to 30'
ELSE 'The quantity is less than 30'
END quantityText
FROM orderdetails;

--====================================================================================================================
-- CHAPTER - COMMENTS

-- single line comment

/* multiline comment
Select all the columns
of all the records
in the Customers table:*/
SELECT
    * FROM customers; 



