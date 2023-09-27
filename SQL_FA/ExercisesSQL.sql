Use BikeStores
go
------------------------------------RETRIEVE DATA FROM TABLES------------------------------------------------
-- 1 Write a SQL statement that displays all the information about all salespeople. 
SELECT * 
FROM sales.staffs

-- 2 Write a SQL statement to display a string "This is SQL Exercise, Practice and Solution".
SELECT 'This is SQL Exercise, Practice and Solution'

-- 3 Write a SQL query to display three numbers in three columns.
SELECT 1,2,3

--4 Write a SQL query to display the sum of two numbers 10 and 15 from the RDBMS server.
SELECT 10+15

-- 5 Write an SQL query to display the result of an arithmetic expression. 
SELECT 5+10-3 * 7/2

-- 6. Write a SQL statement to display specific columns such as names and commissions for all salespeople.
SELECT staff_id,first_name +' '+last_name AS 'FULL NAME', email 
FROM sales.staffs

--7. Write a query to display the columns in a specific order, such as order date, salesman ID, order number, and purchase amount for all orders.
SELECT order_id, order_status, order_date,customer_id, staff_id
FROM sales.orders

--8. From the following table, write a SQL query to identify the unique salespeople ID. Return salesman_id.
SELECT DISTINCT staff_id
FROM sales.orders

--9. From the following table, write a SQL query to locate salespeople who live in the city of 'Paris'. Return salesperson's name, city.
SELECT staff_id, first_name +' '+last_name AS 'FULL NAME'
FROM sales.staffs
WHERE last_name ='Paris'

--10. From the following table, write a SQL query to find customers whose grade is 200. Return customer_id, cust_name, city, grade, salesman_id. 
SELECT customer_id, first_name +' '+last_name AS 'FULL NAME', city,state
FROM sales.customers
WHERE state ='NY'
--11. From the following table, write a SQL query to find orders that are delivered by a salesperson with ID. 5001. Return ord_no, ord_date, purch_amt. 
SELECT order_id, order_date
FROM sales.orders
WHERE staff_id = '5001'

--12. From the following table, write a SQL query to find the Nobel Prize winner(s) for the year 1970. Return year, subject and winner.
SELECT product_id, model_year,product_name
FROM production.products
WHERE model_year =1970

--13. From the following table, write a SQL query to find the Nobel Prize winner in ‘Literature’ for 1971. Return winner. 
SELECT *
FROM production.products
WHERE model_year = 2016 AND category_id = 6

--14. From the following table, write a SQL query to locate the Nobel Prize winner ‘Dennis Gabor'. Return year, subject.
SELECT model_year, product_name
FROM production.products
WHERE category_id = 6

--15. From the following table, write a SQL query to find the Nobel Prize winners in the field of ‘Physics’ since 1950. Return winner.
SELECT *
FROM production.products
WHERE model_year =2016 AND product_name ='Physics'

--16. From the following table, write a SQL query to find the Nobel Prize winners in ‘Chemistry’ between the years 1965 and 1975. Begin and end values are included. Return year, subject, winner, and country.
SELECT product_id, product_name, model_year
FROM production.products
WHERE model_year BETWEEN 2016 AND 2023  AND product_name ='Chemistry'

--17. Write a SQL query to display all details of the Prime Ministerial winners after 1972 of Menachem Begin and Yitzhak Rabin.

SELECT *
FROM production.products
WHERE model_year >1972 AND product_name IN ('Menachem Begin','Yitzhak Rabin')

--18. From the following table, write a SQL query to retrieve the details of the winners whose first names match with the string ‘Louis’. Return year, subject, winner, country, and category.
SELECT model_year, product_name,category_id
FROM production.products
WHERE product_name ='Louis'

--19. From the following table, write a SQL query that combines the winners in Physics, 1970 and in Economics, 1971. Return year, subject, winner, country, and category.
SELECT model_year, product_name, category_id
FROM production.products
WHERE product_name ='Phisics'AND model_year = 1970
UNION
SELECT model_year, product_name, category_id
FROM production.products
WHERE product_name ='Economics'AND model_year = 1971

--20. From the following table, write a SQL query to find the Nobel Prize winners in 1970 excluding the subjects of Physiology and Economics. Return year, subject, winner, country, and category.
SELECT model_year, product_name,category_id
FROM production.products
WHERE model_year = 1970 AND product_name NOT IN('Physiology','Economics')

--21. From the following table, write a SQL query to combine the winners in 'Physiology' before 1971 and winners in 'Peace' on or after 1974. Return year, subject, winner, country, and category.
SELECT model_year, product_name,category_id
FROM production.products
WHERE model_year < 1970 AND product_name IN('Physiology')
UNION
SELECT model_year, product_name,category_id
FROM production.products
WHERE model_year > 1974 AND product_name IN('Peace')

--22. From the following table, write a SQL query to find the details of the Nobel Prize winner 'Johannes Georg Bednorz'. Return year, subject, winner, country, and category. 
SELECT model_year, product_name,category_id
FROM production.products
WHERE product_name ='Johannes Georg Bednorz'

--23. From the following table, write a SQL query to find Nobel Prize winners for the subject that does not begin with the letter 'P'. Return year, subject, winner, country, and category. Order the result by year, descending and winner in ascending.
SELECT model_year, product_name,category_id
FROM production.products
WHERE product_name NOT LIKE 'P%'
ORDER BY model_year DESC, product_name 

--24. From the following table, write a SQL query to find the details of 1970 Nobel Prize winners. Order the results by subject, ascending except for 'Chemistry' and ‘Economics’ which will come at the end of the result set. Return year, subject, winner, country, and category.
SELECT model_year, product_name,category_id
FROM production.products
WHERE model_year = 1970
ORDER BY CASE 
			WHEN product_name IN('Chemistry','Economics') THEN 1 ELSE 0
		END ASC, product_name,category_id


--25. From the following table, write a SQL query to select a range of products whose price is in the range Rs.200 to Rs.600. Begin and end values are included. Return pro_id, pro_name, pro_price, and pro_com.
SELECT product_id, product_name,list_price
FROM production.products
WHERE list_price BETWEEN 200 AND 600

--26. From the following table, write a SQL query to calculate the average price for a manufacturer code of 16. Return avg.
SELECT AVG(list_price)
FROM production.products
WHERE product_id =16

--27. From the following table, write a SQL query to display the pro_name as 'Item Name' and pro_priceas 'Price in Rs.' 
SELECT product_name AS 'Item Name', list_price AS 'Price in Rs'
FROM production.products

--28. From the following table, write a SQL query to find the items whose prices are higher than or equal to $250. Order the result by product price in descending, then product name in ascending. Return pro_name and pro_price.
SELECT product_name, list_price
FROM production.products
WHERE list_price >=250
ORDER BY list_price DESC, product_name

--29. From the following table, write a SQL query to calculate average price of the items for each company. Return average price and company code.
SELECT AVG(list_price), product_id
FROM production.products
GROUP BY product_id

--30. From the following table, write a SQL query to find the cheapest item(s). Return pro_name and, pro_price.
SELECT TOP(1) list_price, product_name 
FROM production.products
ORDER BY list_price 

--31. From the following table, write a SQL query to find the unique last name of all employees. Return emp_lname. 
SELECT DISTINCT last_name
FROM sales.staffs

--32. From the following table, write a SQL query to find the details of employees whose last name is 'Snares'. Return emp_idno, emp_fname, emp_lname, and emp_dept.
SELECT staff_id, first_name, last_name, store_id
FROM sales.staffs
WHERE last_name = 'Snares'

--33. From the following table, write a SQL query to retrieve the details of the employees who work in the department 57. Return emp_idno, emp_fname, emp_lname and emp_dept.
SELECT staff_id, first_name, last_name, store_id 
FROM sales.staffs
WHERE store_id =57

--------------------------------------------------------------------------------------------------------------------
-------------------------------------- BOOLEAN AND RELATIONAL OPERATORS---------------------------------------------

--1. From the following table, write a SQL query to locate the details of customers with grade values above 100. Return customer_id, cust_name, city, grade, and salesman_id.
SELECT customer_id, first_name+' '+last_name AS 'FULL NAME', city,state
FROM sales.customers
WHERE customer_id > 100

--2. From the following table, write a SQL query to find all the customers in ‘New York’ city who have a grade value above 100. Return customer_id, cust_name, city, grade, and salesman_id.
SELECT customer_id, first_name+' '+last_name AS 'FULL NAME', city,state
FROM sales.customers
WHERE city = 'New York' AND customer_id > 100

--3. From the following table, write a SQL query to find customers who are from the city of New York or have a grade of over 100. Return customer_id, cust_name, city, grade, and salesman_id.
SELECT customer_id, first_name+' '+last_name AS 'FULL NAME', city,state
FROM sales.customers
WHERE city = 'New York' OR customer_id > 100

--4. From the following table, write a SQL query to find customers who are either from the city 'New York' or who do not have a grade greater than 100. Return customer_id, cust_name, city, grade, and salesman_id.
SELECT customer_id, first_name+' '+last_name AS 'FULL NAME', city,state
FROM sales.customers
WHERE city = 'New York' OR customer_id < 100

--5. From the following table, write a SQL query to identify customers who do not belong to the city of 'New York' or have a grade value that exceeds 100. Return customer_id, cust_name, city, grade, and salesman_id.
SELECT customer_id, first_name+' '+last_name AS 'FULL NAME', city,state
FROM sales.customers
WHERE city NOT IN ('New York') OR customer_id > 100

--6. From the following table, write a SQL query to find details of all orders excluding those with ord_date equal to '2012-09-10' and salesman_id higher than 5005 or purch_amt greater than 1000.Return ord_no, purch_amt, ord_date, customer_id and salesman_id.
SELECT order_id, order_date, customer_id
FROM sales.orders
WHERE order_date NOT IN('2012-09-10') AND staff_id>5005 OR customer_id>1000

--7. From the following table, write a SQL query to find the details of those salespeople whose commissions range from 0.10 to0.12. Return salesman_id, name, city, and commission.
SELECT staff_id, first_name+' '+last_name AS 'FULL NAME',active
FROM sales.staffs
WHERE active BETWEEN 1 AND 2

--8. From the following table, write a SQL query to find details of all orders with a purchase amount less than 200 or exclude orders with an order date greater than or equal to '2012-02-10' and a customer ID less than 3009. Return ord_no, purch_amt, ord_date, customer_id and salesman_id.
SELECT order_id, order_date, customer_id, staff_id
FROM sales.orders
WHERE staff_id < 200 OR order_date >='2012-02-10' AND customer_id <3009

--9. From the following table, write a SQL query to find all orders that meet the following conditions. Exclude combinations of order date equal to '2012-08-17' or customer ID greater than 3005 and purchase amount less than 1000.
SELECT order_id, order_date, customer_id, staff_id
FROM sales.orders
WHERE NOT(order_date >='2012-08-17' OR customer_id >3005 AND  staff_id <1000)


--10. Write a SQL query that displays order number, purchase amount, and the achieved and unachieved percentage (%) for those orders that exceed 50% of the target value of 6000.
SELECT order_id, list_price,(100*list_price)/6000 AS "Achieved %", (100*(6000-list_price)/6000) AS "Unachieved %"
FROM sales.order_items
WHERE (100* list_price)/6000 >50;

--11. From the following table, write a SQL query to find the details of all employees whose last name is ‘Dosni’ or ‘Mardy’. Return emp_idno, emp_fname, emp_lname, and emp_dept.
SELECT staff_id, first_name, last_name, store_id
FROM sales.staffs
where last_name ='Dosni' OR last_name ='Mardy'

--12. From the following table, write a SQL query to find the employees who work at depart 47 or 63. Return emp_idno, emp_fname, emp_lname, and emp_dept.   
SELECT staff_id, first_name, last_name, store_id
FROM sales.staffs
WHERE store_id = 47 OR store_id = 63