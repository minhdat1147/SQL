---------------------SQL Exercises, Practice, Solution - Retrieve data from tables---------------------------------

--1. Write a SQL statement that displays all the information about all salespeople. 
SELECT *
FROM salesman
GO
--2. Write a SQL statement to display a string "This is SQL Exercise, Practice and Solution".
SELECT 'This is SQL Exercise, Practice and Solution'
GO
--3. Write a SQL query to display three numbers in three columns.
SELECT 2 AS COLUMN_1,5 AS COLUMN_2,6 AS COLUMN_3;
GO
--4. Write a SQL query to display the sum of two numbers 10 and 15 from the RDBMS server.
SELECT 10+15 AS SUM_COLUMN
GO
--5. Write an SQL query to display the result of an arithmetic expression. 
SELECT 12+3-10/2%1
GO
--6. Write a SQL statement to display specific columns such as names and commissions for all salespeople.
SELECT NAME, COMMISSION
FROM SALESMAN
GO
--7. Write a query to display the columns in a specific order, such as order date, salesman ID, order number, and purchase amount for all orders.
SELECT ORD_DATE, SALESMAN_ID, ORD_NO, PURCH_AMT
FROM ORDERS
GO
--8. From the following table, write a SQL query to identify the unique salespeople ID. Return salesman_id. 
SELECT DISTINCT salesman_id 
FROM ORDERS
GO
--9. From the following table, write a SQL query to locate salespeople who live in the city of 'Paris'. Return salesperson's name, city.
SELECT name, city
FROM salesman
WHERE city = 'Paris'
GO
--10. From the following table, write a SQL query to find customers whose grade is 200. Return customer_id, cust_name, city, grade, salesman_id.
SELECT customer_id, cust_name, city,grade, salesman_id
FROM customer
WHERE grade =200
GO
--11. From the following table, write a SQL query to find orders that are delivered by a salesperson with ID. 5001. Return ord_no, ord_date, purch_amt.
SELECT ord_no, ord_date, purch_amt
FROM orders
WHERE salesman_id =5001
GO
--12. From the following table, write a SQL query to find the Nobel Prize winner(s) for the year 1970. Return year, subject and winner.
SELECT  year, subject, winner
FROM nobel_win
WHERE year=1970
GO
--13. From the following table, write a SQL query to find the Nobel Prize winner in ‘Literature’ for 1971. Return winner.
SELECT  winner
FROM nobel_win
WHERE SUBJECT = 'Literature' AND YEAR =1971
GO
--14. From the following table, write a SQL query to locate the Nobel Prize winner ‘Dennis Gabor'. Return year, subject.
SELECT  year, subject
FROM nobel_win
WHERE winner= 'Dennis Gabor'
GO
--15. From the following table, write a SQL query to find the Nobel Prize winners in the field of ‘Physics’ since 1950. Return winner.
SELECT  winner
FROM nobel_win
WHERE SUBJECT = 'Physics' AND YEAR >= 1950
GO
--16. From the following table, write a SQL query to find the Nobel Prize winners in ‘Chemistry’ between the years 1965 and 1975. Begin and end values are included. Return year, subject, winner, and country.
SELECT  year, subject, winner, country
FROM nobel_win
WHERE SUBJECT = 'Chemistry' AND YEAR BETWEEN 1965 AND 1975
GO
--17. Write a SQL query to display all details of the Prime Ministerial winners after 1972 of Menachem Begin and Yitzhak Rabin.
SELECT  *
FROM nobel_win
WHERE WINNER IN ('Menachem Begin','Yitzhak Rabin') AND YEAR >1972
GO
/* CASE 2:
	SELECT  *
	FROM nobel_win
	WHERE WINNER ='Menachem Begin' OR WINNER ='Yitzhak Rabin' AND YEAR >1972
	*/
--18. From the following table, write a SQL query to retrieve the details of the winners whose first names match with the string ‘Louis’. Return year, subject, winner, country, and category. 
SELECT *
FROM nobel_win
WHERE WINNER LIKE 'Louis %'
GO
--19. From the following table, write a SQL query that combines the winners in Physics, 1970 and in Economics, 1971. Return year, subject, winner, country, and category.
SELECT *
FROM nobel_win
WHERE SUBJECT IN ('Physics') AND YEAR =1970
UNION 
SELECT *
FROM nobel_win
WHERE SUBJECT IN('Economics') AND YEAR =1971
GO
--20. From the following table, write a SQL query to find the Nobel Prize winners in 1970 excluding the subjects of Physiology and Economics. Return year, subject, winner, country, and category. 
SELECT *
FROM nobel_win
WHERE YEAR  = 1970 AND SUBJECT NOT IN('Physiology', 'Economics')
GO
--21. From the following table, write a SQL query to combine the winners in 'Physiology' before 1971 and winners in 'Peace' on or after 1974. Return year, subject, winner, country, and category.
SELECT *
FROM nobel_win
WHERE SUBJECT = 'Physiology' AND YEAR <1971
UNION
SELECT *
FROM nobel_win
WHERE SUBJECT = 'Peace' AND YEAR >=1974
GO
--22. From the following table, write a SQL query to find the details of the Nobel Prize winner 'Johannes Georg Bednorz'. Return year, subject, winner, country, and category.
SELECT *
FROM nobel_win
WHERE WINNER ='Johannes Georg Bednorz'
GO
--23. From the following table, write a SQL query to find Nobel Prize winners for the subject that does not begin with the letter 'P'. Return year, subject, winner, country, and category. Order the result by year, descending and winner in ascending. 
SELECT *
FROM nobel_win
WHERE SUBJECT NOT LIKE 'P%' 
ORDER BY YEAR DESC, WINNER 
GO
--24. From the following table, write a SQL query to find the details of 1970 Nobel Prize winners. Order the results by subject, ascending except for 'Chemistry' and ‘Economics’ which will come at the end of the result set. Return year, subject, winner, country, and category.
SELECT *
FROM nobel_win
WHERE YEAR =1970 
ORDER BY 
CASE
    WHEN SUBJECT IN('Chemistry','Economics') THEN 1 ELSE 0
END
GO
--25. From the following table, write a SQL query to select a range of products whose price is in the range Rs.200 to Rs.600. Begin and end values are included. Return pro_id, pro_name, pro_price, and pro_com. 
SELECT pro_id, pro_name, pro_price, pro_com
FROM item_mast
WHERE PRO_PRICE  BETWEEN 200 AND 600
GO
--26. From the following table, write a SQL query to calculate the average price for a manufacturer code of 16. Return avg. 
SELECT AVG(PRO_PRICE)
FROM item_mast
WHERE PRO_COM = 16
GO
--27. From the following table, write a SQL query to display the pro_name as 'Item Name' and pro_priceas 'Price in Rs.'
SELECT PRO_NAME AS "Item Name", PRO_PRICE AS "Price in Rs."
FROM item_mast
GO
--28. From the following table, write a SQL query to find the items whose prices are higher than or equal to $250. Order the result by product price in descending, then product name in ascending. Return pro_name and pro_price. 
SELECT pro_name, pro_price
FROM item_mast
WHERE PRO_PRICE >=250
ORDER BY PRO_PRICE DESC, pro_name
GO
--29. From the following table, write a SQL query to calculate average price of the items for each company. Return average price and company code.
SELECT AVG(PRO_PRICE), PRO_COM
FROM item_mast
GROUP BY PRO_COM
GO
--30. From the following table, write a SQL query to find the cheapest item(s). Return pro_name and, pro_price.
-- CASE 1:
SELECT TOP(1) WITH TIES pro_price, pro_name
FROM item_mast
ORDER BY pro_price
GO 
-- CASE 2:
SELECT pro_name, pro_price
FROM item_mast
WHERE pro_price = 
	(SELECT MIN(pro_price) FROM item_mast)
GO
--31. From the following table, write a SQL query to find the unique last name of all employees. Return emp_lname.
--CASE 1:
SELECT DISTINCT emp_lname
FROM emp_details
GO
--CASE 2:
 SELECT emp_lname
FROM emp_details
GROUP BY emp_lname
GO
--32. From the following table, write a SQL query to find the details of employees whose last name is 'Snares'. Return emp_idno, emp_fname, emp_lname, and emp_dept.
SELECT emp_idno, emp_fname, emp_lname, emp_dept
FROM emp_details
WHERE EMP_LNAME = 'Snares'
GO
--33. From the following table, write a SQL query to retrieve the details of the employees who work in the department 57. Return emp_idno, emp_fname, emp_lname and emp_dept.
SELECT *
FROM emp_details
WHERE EMP_DEPT = 57
GO
------------------------------------------------------------------SQL Exercises, Practice, Solution - Using Boolean and Relational operators-----------------------------------------------
--1. From the following table, write a SQL query to locate the details of customers with grade values above 100. Return customer_id, cust_name, city, grade, and salesman_id. 
SELECT customer_id, cust_name, city, grade, salesman_id
FROM customer
WHERE GRADE >100
GO
--2. From the following table, write a SQL query to find all the customers in ‘New York’ city who have a grade value above 100. Return customer_id, cust_name, city, grade, and salesman_id.
SELECT *
FROM customer
WHERE GRADE >100 AND  CITY IN('New York')
GO
--3. From the following table, write a SQL query to find customers who are from the city of New York or have a grade of over 100. Return customer_id, cust_name, city, grade, and salesman_id.
SELECT *
FROM customer
WHERE GRADE >100 OR CITY IN('New York')
GO
--4. From the following table, write a SQL query to find customers who are either from the city 'New York' or who do not have a grade greater than 100. Return customer_id, cust_name, city, grade, and salesman_id. 
SELECT *
FROM customer
WHERE NOT GRADE>100 OR CITY ='New York'
GO
--5. From the following table, write a SQL query to identify customers who do not belong to the city of 'New York' or have a grade value that exceeds 100. Return customer_id, cust_name, city, grade, and salesman_id.
SELECT *
FROM customer
WHERE NOT GRADE >100 OR NOT CITY ='New York'
GO
--6. From the following table, write a SQL query to find details of all orders excluding those with ord_date equal to '2012-09-10' and salesman_id higher than 5005 or purch_amt greater than 1000.Return ord_no, purch_amt, ord_date, customer_id and salesman_id.
SELECT *
FROM orders
WHERE NOT ((ord_date = '2012-09-10' AND salesman_id >5005) OR purch_amt > 1000)
GO
--7. From the following table, write a SQL query to find the details of those salespeople whose commissions range from 0.10 to0.12. Return salesman_id, name, city, and commission.
SELECT *
FROM salesman
WHERE commission  BETWEEN  0.10 AND 0.12
GO
--8. From the following table, write a SQL query to find details of all orders with a purchase amount less than 200 or exclude orders with an order date greater than or equal to '2012-02-10' and a customer ID less than 3009. Return ord_no, purch_amt, ord_date, customer_id and salesman_id. 
SELECT *
FROM orders
WHERE purch_amt <200 OR NOT (ord_date >= '2012-02-10' AND ord_no = 3009)
GO
--9. From the following table, write a SQL query to find all orders that meet the following conditions. Exclude combinations of order date equal to '2012-08-17' or customer ID greater than 3005 and purchase amount less than 1000.
SELECT * 
FROM  orders 
WHERE NOT((ord_date ='2012-08-17' 
OR customer_id>3005) 
AND purch_amt<1000)
GO
--10. Write a SQL query that displays order number, purchase amount, and the achieved and unachieved percentage (%) for those orders that exceed 50% of the target value of 6000.
SELECT ord_no, purch_amt,(100*purch_amt)/6000 AS "Achieved %", (100*(6000-purch_amt)/6000) AS "Unachieved %"
FROM  orders 
WHERE (100*purch_amt)/6000>50;
GO
--11. From the following table, write a SQL query to find the details of all employees whose last name is ‘Dosni’ or ‘Mardy’. Return emp_idno, emp_fname, emp_lname, and emp_dept.
SELECT *
FROM  emp_details 
WHERE EMP_LNAME ='Dosni' OR EMP_LNAME  = 'Mardy'
GO

--12. From the following table, write a SQL query to find the employees who work at depart 47 or 63. Return emp_idno, emp_fname, emp_lname, and emp_dept.
SELECT *
FROM  emp_details 
WHERE EMP_DEPT = 47 OR EMP_DEPT = 63
go
------------------------------------------------------------------------SQL Exercises, Practice, Solution - Wildcard and Special operators--------------------------------------------------------
--1. From the following table, write a SQL query to find the details of those salespeople who come from the 'Paris' City or 'Rome' City. Return salesman_id, name, city, commission.
SELECT *
FROM salesman
WHERE CITY ='Paris' OR CITY = 'Rome'
GO
--2. From the following table, write a SQL query to find the details of the salespeople who come from either 'Paris' or 'Rome'. Return salesman_id, name, city, commission.
SELECT *
FROM salesman
WHERE CITY IN('Paris','Rome')
GO
--3. From the following table, write a SQL query to find the details of those salespeople who live in cities other than Paris and Rome. Return salesman_id, name, city, commission.
SELECT *
FROM salesman
WHERE CITY NOT IN('Paris','Rome')
GO
--4. From the following table, write a SQL query to retrieve the details of all customers whose ID belongs to any of the values 3007, 3008 or 3009. Return customer_id, cust_name, city, grade, and salesman_id.
SELECT *
FROM customer
WHERE customer_id IN(3007,3008,3009)
GO
--5. From the following table, write a SQL query to find salespeople who receive commissions between 0.12 and 0.14 (begin and end values are included). Return salesman_id, name, city, and commission.
SELECT *
FROM salesman
WHERE commission BETWEEN 0.12 AND 0.14
GO
--6. From the following table, write a SQL query to select orders between 500 and 4000 (begin and end values are included). Exclude orders amount 948.50 and 1983.43. Return ord_no, purch_amt, ord_date, customer_id, and salesman_id.
SELECT *
FROM orders
WHERE ((purch_amt BETWEEN 500 AND 4000) AND purch_amt NOT IN(948.50,1983.43))
GO
--7. From the following table, write a SQL query to retrieve the details of the salespeople whose names begin with any letter between 'A' and 'L' (not inclusive). Return salesman_id, name, city, commission. 
SELECT *
FROM salesman
WHERE name BETWEEN 'A' AND 'L'
GO
--8. From the following table, write a SQL query to find the details of all salespeople except those whose names begin with any letter between 'A' and 'L' (not inclusive). Return salesman_id, name, city, commission. 
SELECT *
FROM salesman
WHERE NOT name BETWEEN 'A' AND 'L'
GO
--9. From the following table, write a SQL query to retrieve the details of the customers whose names begins with the letter 'B'. Return customer_id, cust_name, city, grade, salesman_id..
SELECT *
FROM customer
WHERE cust_name LIKE 'B%'
GO
--10. From the following table, write a SQL query to find the details of the customers whose names end with the letter 'n'. Return customer_id, cust_name, city, grade, salesman_id.
SELECT *
FROM customer
WHERE cust_name LIKE '%n'
GO
--11. From the following table, write a SQL query to find the details of those salespeople whose names begin with ‘N’ and the fourth character is 'l'. Rests may be any character. Return salesman_id, name, city, commission.
SELECT *
FROM salesman
WHERE name LIKE 'N__l%'
GO
--12. From the following table, write a SQL query to find those rows where col1 contains the escape character underscore ( _ ). Return col1.
SELECT *
FROM testtable
WHERE col1 LIKE '%/_%' ESCAPE '/';
GO
--13. From the following table, write a SQL query to identify those rows where col1 does not contain the escape character underscore ( _ ). Return col1.
SELECT *
FROM testtable
WHERE col1 NOT LIKE '%/_%' ESCAPE '/'
GO
--14. From the following table, write a SQL query to find rows in which col1 contains the forward slash character ( / ). Return col1.
SELECT *
FROM testtable
WHERE col1 LIKE '%//%' ESCAPE '/'
GO
--15. From the following table, write a SQL query to identify those rows where col1 does not contain the forward slash character ( / ). Return col1. 
SELECT *
FROM testtable
WHERE col1 NOT LIKE '%//%' ESCAPE '/'
GO 
--16. From the following table, write a SQL query to find those rows where col1 contains the string ( _/ ). Return col1.
SELECT *
FROM testtable
WHERE col1 LIKE '%/_//%' ESCAPE '/'
GO
--17. From the following table, write a SQL query to find those rows where col1 does not contain the string ( _/ ). Return col1.
SELECT *
FROM testtable
WHERE col1 NOT LIKE '%/_//%' ESCAPE '/'
GO
--18. From the following table, write a SQL query to find those rows where col1 contains the character percent ( % ). Return col1.
SELECT *
FROM testtable
WHERE col1 LIKE '%/%%' ESCAPE'/'
GO
--19. From the following table, write a SQL query to find those rows where col1 does not contain the character percent ( % ). Return col1.
SELECT *
FROM testtable
WHERE col1 NOT LIKE '%/%%' ESCAPE'/'
GO
--20. From the following table, write a SQL query to find all those customers who does not have any grade. Return customer_id, cust_name, city, grade, salesman_id. 
SELECT *
FROM customer
WHERE grade IS NULL
GO
--21. From the following table, write a SQL query to locate all customers with a grade value. Return customer_id, cust_name,city, grade, salesman_id.
SELECT *
FROM customer
WHERE grade IS NOT NULL
GO
--22. From the following table, write a SQL query to locate the employees whose last name begins with the letter 'D'. Return emp_idno, emp_fname, emp_lname and emp_dept.
SELECT *
FROM emp_details
WHERE EMP_LNAME LIKE 'D%'
GO
-------------------------------------------------Functions and Group by - Exercises, Practice, Solution-----------------------------------------------------------------------
--1. From the following table, write a SQL query to calculate total purchase amount of all orders. Return total purchase amount.
SELECT SUM(purch_amt)
FROM orders
GO
--2. From the following table, write a SQL query to calculate the average purchase amount of all orders. Return average purchase amount.
SELECT AVG(purch_amt)
FROM orders
GO
--3. From the following table, write a SQL query that counts the number of unique salespeople. Return number of salespeople.
SELECT COUNT(DISTINCT salesman_id)
FROM orders
GO
--4. From the following table, write a SQL query to count the number of customers. Return number of customers.
SELECT COUNT(customer_id )
FROM orders
GO
--5. From the following table, write a SQL query to determine the number of customers who received at least one grade for their activity.
SELECT COUNT (ALL grade) 
FROM customer
GO
--6. From the following table, write a SQL query to find the maximum purchase amount.
SELECT MAX(purch_amt)
FROM orders
GO
--7. From the following table, write a SQL query to find the minimum purchase amount.
SELECT MIN(purch_amt)
FROM orders
GO
--8. From the following table, write a SQL query to find the highest grade of the customers in each city. Return city, maximum grade.  
SELECT CITY, MAX(grade )
FROM customer
GROUP BY CITY
GO
--9. From the following table, write a SQL query to find the highest purchase amount ordered by each customer. Return customer ID, maximum purchase amount. 
SELECT customer_id, MAX(purch_amt)
FROM orders
GROUP BY customer_id
GO
--10. From the following table, write a SQL query to find the highest purchase amount ordered by each customer on a particular date. Return, order date and highest purchase amount. 
SELECT customer_id, ord_date, MAX(purch_amt)
FROM orders
GROUP BY customer_id, ord_date
GO
--11. From the following table, write a SQL query to determine the highest purchase amount made by each salesperson on '2012-08-17'. Return salesperson ID, purchase amount
SELECT salesman_id,MAX(purch_amt) 
FROM orders 
WHERE ord_date = '2012-08-17' 
GROUP BY salesman_id
GO
--12. From the following table, write a SQL query to find the highest order (purchase) amount by each customer on a particular order date. Filter the result by highest order (purchase) amount above 2000.00. Return customer id, order date and maximum purchase amount.
SELECT customer_id, ord_date, MAX(purch_amt)
FROM orders
WHERE purch_amt >2000
GROUP BY customer_id, ord_date
GO
--13. From the following table, write a SQL query to find the maximum order (purchase) amount in the range 2000 - 6000 (Begin and end values are included.) by combination of each customer and order date. Return customer id, order date and maximum purchase amount. 
SELECT customer_id,ord_date,MAX(purch_amt) 
FROM orders 
GROUP BY customer_id,ord_date 
HAVING MAX(purch_amt) BETWEEN 2000 AND 6000
GO
--14. From the following table, write a SQL query to find the maximum order (purchase) amount based on the combination of each customer and order date. Filter the rows for maximum order (purchase) amount is either 2000, 3000, 5760, 6000. Return customer id, order date and maximum purchase amount.
SELECT customer_id, ord_date, MAX(purch_amt)
FROM orders
GROUP BY customer_id, ord_date
HAVING MAX(purch_amt) IN(2000, 3000,5760,6000)
GO
--15. From the following table, write a SQL query to determine the maximum order amount for each customer. The customer ID should be in the range 3002 and 3007(Begin and end values are included.). Return customer id and maximum purchase amount.
SELECT customer_id, MAX(purch_amt)
FROM orders
WHERE customer_id BETWEEN 3002 AND 3007
GROUP BY customer_id
GO
--16. From the following table, write a SQL query to find the maximum order (purchase) amount for each customer. The customer ID should be in the range 3002 and 3007(Begin and end values are included.). Filter the rows for maximum order (purchase) amount is higher than 1000. Return customer id and maximum purchase amount.
SELECT customer_id, MAX(purch_amt)
FROM orders
WHERE customer_id BETWEEN 3002 AND 3007
GROUP BY customer_id
HAVING MAX(purch_amt) >1000
GO
--17. From the following table, write a SQL query to determine the maximum order (purchase) amount generated by each salesperson. Filter the rows for the salesperson ID is in the range 5003 and 5008 (Begin and end values are included.). Return salesperson id and maximum purchase amount. 
SELECT salesman_id, MAX(purch_amt)
FROM orders
WHERE salesman_id BETWEEN 5003 AND 5008
GROUP BY salesman_id
GO
--18. From the following table, write a SQL query to count all the orders generated on '2012-08-17'. Return number of orders.
SELECT COUNT(*)
FROM orders
WHERE  ord_date ='2012-08-17'
GO
--19. From the following table, write a SQL query to count the number of salespeople in a city. Return number of salespeople.
SELECT COUNT(*)
FROM salesman
WHERE CITY IS NOT NULL
GO
--20. From the following table, write a SQL query to count the number of orders based on the combination of each order date and salesperson. Return order date, salesperson id.
SELECT COUNT(*),ord_date, salesman_id
FROM orders
GROUP BY ord_date, salesman_id
GO
--21. From the following table, write a SQL query to calculate the average product price. Return average product price.
SELECT AVG(PRO_PRICE)
FROM item_mast
GO
--22. From the following table, write a SQL query to count the number of products whose price are higher than or equal to 350. Return number of products. 
SELECT COUNT(*)
FROM item_mast
WHERE PRO_PRICE >=350
GO
--23. From the following table, write a SQL query to compute the average price for unique companies. Return average price and company id.
SELECT PRO_COM, AVG(PRO_PRICE)
FROM item_mast
GROUP BY PRO_COM
GO
--24. From the following table, write a SQL query to compute the sum of the allotment amount of all departments. Return sum of the allotment amount.
SELECT SUM(DPT_ALLOTMENT)
FROM emp_department
GO
--25. From the following table, write a SQL query to count the number of employees in each department. Return department code and number of employees.
SELECT COUNT(EMP_IDNO), EMP_DEPT
FROM emp_details
GROUP BY EMP_DEPT
go
-------------------------------------------------------------------Formatting Output - Exercises, Practice, Solution--------------------------------------------
--1. From the following table, write a SQL query to select all the salespeople. Return salesman_id, name, city, commission with the percent sign (%).
SELECT salesman_id,name,city,'%',commission*100 
FROM salesman
GO
--2. From the following table, write a SQL query to find the number of orders booked for each day. Return the result in a format like "For 2001-10-10 there are 15 orders"."
SELECT ' For',ord_date,'there are', COUNT(ord_no),'orders.' 
FROM orders 
GROUP BY ord_date
GO
--3. From the following table, write a SQL query to find all the orders. Sort the result-set in ascending order by ord_no. Return all fields. 
SELECT *
FROM orders 
ORDER BY ord_no
GO
--4. From the following table, write a SQL query to find all the orders. Sort the result-set in descending order by ord_date. Return all fields.
SELECT *
FROM orders 
ORDER BY ord_no DESC
GO
--5. From the following table, write a SQL query to find all the orders. Sort the result-set in descending order by ord_date and purch_amt. Return all fields.
SELECT *
FROM orders 
ORDER BY ord_date, purch_amt DESC
GO
--6. From the following table, write a SQL query to find all the customers. Sort the result-set by customer_id. Return cust_name, city, grade.
SELECT cust_name, city, grade
FROM customer
ORDER BY customer_id
GO
--7. From the following table, write a SQL query that calculates the maximum purchase amount generated by each salesperson for each order date. Sort the result-set by salesperson id and order date in ascending order. Return salesperson id, order date and maximum purchase amount.
SELECT salesman_id, ord_date, MAX(purch_amt)
FROM orders
GROUP BY salesman_id, ord_date
ORDER BY salesman_id, ord_date
GO
--8. From the following table, write a SQL query to find all the customers. Sort the result-set in descending order on 3rd field. Return customer name, city and grade.
SELECT cust_name, city, grade
FROM customer
ORDER BY 3 DESC
GO
--9. From the following table, write a SQL query that counts the unique orders and the highest purchase amount for each customer. Sort the result-set in descending order on 2nd field. Return customer ID, number of distinct orders and highest purchase amount by each customer. 
SELECT customer_id, COUNT(DISTINCT ord_no), MAX(purch_amt )
FROM orders
GROUP BY customer_id
ORDER BY 2 DESC
GO
--10. From the following table, write a SQL query to calculate the summation of purchase amount, total commission (15% for all salespeople) by each order date. Sort the result-set on order date. Return order date, summation of purchase amount and commission.
SELECT ord_date, SUM(purch_amt), SUM(purch_amt)* .15
FROM orders
GROUP BY ord_date
ORDER BY ord_date
GO
--------------------------------------------------------------SQL Exercises, Practice, Solution - Query on Multiple Tables--------------------------------------------------------------
--1. From the following tables, write a SQL query to find the salespeople and customers who live in the same city. Return customer name, salesperson name and salesperson city.
SELECT C.cust_name, S.name, S.city    
FROM salesman AS S, customer AS C
WHERE S.city = C.city
GO
--2. From the following tables, write a SQL query to locate all the customers and the salesperson who works for them. Return customer name, and salesperson name.
SELECT C.cust_name, S.name   
FROM salesman AS S, customer AS C
WHERE S.salesman_id  = C.salesman_id 
GO
--3. From the following tables, write a SQL query to find those salespeople who generated orders for their customers but are not located in the same city. Return ord_no, cust_name, customer_id (orders table), salesman_id (orders table).
SELECT O.ord_no, C.cust_name, O.customer_id, O.salesman_id 
FROM salesman AS S, customer AS C, orders AS O
WHERE S.salesman_id  = C.salesman_id AND C.customer_id = O.customer_id AND C.city != S.city
go
--4. From the following tables, write a SQL query to locate the orders made by customers. Return order number, customer name. 
SELECT O.ord_no, C.cust_name
FROM customer AS C, orders AS O
WHERE C.customer_id = O.customer_id
go
--5. From the following tables, write a SQL query to find those customers where each customer has a grade and is served by a salesperson who belongs to a city. Return cust_name as "Customer", grade as "Grade".
SELECT customer.cust_name AS "Customer",
customer.grade AS "Grade",orders.ord_no AS "Order No."
FROM orders, salesman, customer
WHERE orders.customer_id = customer.customer_id
AND orders.salesman_id = salesman.salesman_id
AND salesman.city IS NOT NULL
AND customer.grade IS NOT NULL
GO
--6. From the following table, write a SQL query to find those customers who are served by a salesperson and the salesperson earns commission in the range of 12% to 14% (Begin and end values are included.). Return cust_name AS "Customer", city AS "City"
SELECT C.cust_name AS "Customer", S.city AS "City"
FROM customer AS C, salesman AS S
WHERE S.salesman_id  = C.salesman_id  AND commission BETWEEN 0.12 AND 0.14
GO
--7. From the following tables, write a SQL query to find all orders executed by the salesperson and ordered by the customer whose grade is greater than or equal to 200. Compute purch_amt*commission as “Commission”. Return customer name, commission as “Commission%” and Commission.
SELECT ord_no, cust_name, commission AS "Commission%",
purch_amt*commission AS "Commission"
FROM salesman,orders,customer
WHERE orders.customer_id = customer.customer_id
AND orders.salesman_id = salesman.salesman_id
AND customer.grade>=200;
GO
-- 8. From the following table, write a SQL query to find those customers who placed orders on October 5, 2012. Return customer_id, cust_name, city, grade, salesman_id, ord_no, purch_amt, ord_date, customer_id and salesman_id.
SELECT *
FROM customer a,orders  b 
WHERE a.customer_id=b.customer_id 
AND b.ord_date='2012-10-05'
GO
-----------------------------------------------------------HR Database - SORT FILTER: Exercises, Practice, Solution--------------------------------------------------------------
--1. From the following table, write a SQL query to find those employees whose salaries are less than 6000. Return full name (first and last name), and salary.
SELECT FIRST_NAME ||' '|| LAST_NAME AS FULL_NAME, SALARY   
FROM employees
WHERE SALARY < 6000
GO
--2. From the following table, write a SQL query to find those employees whose salary is higher than 8000. Return first name, last name and department number and salary.
SELEGOCT first_name,last_name, department_id, salary
 FROM employees
  WHERE salary > 8000;
  GO
--3. From the following table, write a SQL query to find those employees whose last name is "McEwen". Return first name, last name and department ID.
SELECT first_name, last_name, department_id
 FROM employees
  WHERE last_name = 'McEwen';
GO
--4. From the following table, write a SQL query to identify employees who do not have a department number. Return employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary,commission_pct, manager_id and department_id.
SELECT *
 FROM employees
  WHERE department_id IS NULL;
GO
--5. From the following table, write a SQL query to find the details of 'Marketing' department. Return all fields.
SELECT *
 FROM  departments
  WHERE department_name = 'Marketing';
GO
--6. From the following table, write a SQL query to find those employees whose first name does not contain the letter ‘M’. Sort the result-set in ascending order by department ID. Return full name (first and last name together), hire_date, salary and department_id. 
SELECT first_name || ' ' || last_name as Full_Name, hire_date,  
 salary,  department_id
  FROM employees
   WHERE first_name NOT LIKE '%M%'
     ORDER BY department_id;
	 GO
--7. From the following table, write a SQL query to find those employees who earn between 8000 and 12000 (Begin and end values are included.) and get some commission. These employees joined before ‘1987-06-05’ and were not included in the department numbers 40, 120 and 70. Return all fields.
SELECT *
 FROM employees
  WHERE salary BETWEEN 8000 AND 12000 
      AND commission_pct IS NOT NULL
       OR  department_id NOT IN (40 , 120 , 70)
          AND   hire_date < '2003-06-05'
GO
--8. From the following table, write a SQL query to find those employees who do not earn any commission. Return full name (first and last name), and salary.
SELECT first_name ||' '||last_name AS Full_Name, salary
 FROM  employees
  WHERE commission_pct IS NULL;

--9. From the following table, write a SQL query to find the employees whose salary is in the range 9000,17000 (Begin and end values are included). Return full name, contact details and salary.
SELECT first_name ||' '||last_name AS Full_Name,
       phone_number ||' - '|| email AS Contact_Details,
       salary  AS Remuneration
         FROM employees
           WHERE salary BETWEEN 9000 AND 17000;
GO
--10. From the following table, write a SQL query to find the employees whose first name ends with the letter ‘m’. Return the first and last name, and salary.
SELECT first_name, last_name, salary
 FROM employees
  WHERE first_name LIKE '%m';
GO
--11. From the following table, write a SQL query to find those employees whose salaries are not between 7000 and 15000 (Begin and end values are included). Sort the result-set in ascending order by the full name (first and last). Return full name and salary.
SELECT first_name || ' ' || last_name as Name, salary
 FROM  employees
   WHERE salary NOT BETWEEN 7000 AND 15000
     ORDER BY first_name || ' ' || last_name;
GO
--12. From the following table, write a SQL query to find those employees who were hired between November 5th, 2007 and July 5th, 2009. Return full name (first and last), job id and hire date.
SELECT first_name ||' '||last_name AS Full_Name, 
  job_id, hire_date 
   FROM employees 
    WHERE hire_date 
     BETWEEN '2007-11-05' AND '2009-07-05';
GO
--13. From the following table, write a SQL query to find those employees who work either in department 70 or 90. Return full name (first and last name), department id.
SELECT first_name ||' '|| last_name AS Full_Name, department_id
 FROM employees
  WHERE department_id IN (70 , 90);
GO
--14. From the following table, write a SQL query to find those employees who work under a manager. Return full name (first and last name), salary, and manager ID.
SELECT first_name ||' '||last_name AS Full_Name, salary, manager_id
   FROM employees
     WHERE manager_id IS NOT NULL;
GO
--15. From the following table, write a SQL query to find the employees who were hired before June 21st, 2002. Return all fields.
SELECT *
 FROM employees
  WHERE hire_date < '2002-06-21';
GO
--16. From the following table, write a SQL query to find the employees whose managers hold the ID 120, 103, or 145. Return first name, last name, email, salary and manager ID.
SELECT first_name, last_name, email, 
  salary, manager_id
    FROM employees
     WHERE manager_id IN (120 , 103 , 145);
GO
--17. From the following table, write a SQL query to find employees whose first names contain the letters D, S, or N. Sort the result-set in descending order by salary. Return all fields.
SELECT *
 FROM employees
  WHERE first_name LIKE '%D%'
   OR first_name LIKE '%S%'
   OR first_name LIKE '%N%'
    ORDER BY salary DESC;
GO
--18. From the following table, write a SQL query to find those employees who earn above 11000 or the seventh character in their phone number is 3. Sort the result-set in descending order by first name. Return full name (first name and last name), hire date, commission percentage, email, and telephone separated by '-', and salary.
SELECT first_name ||' '||last_name AS Full_Name, hire_date , 
  commission_pct, email ||' -  '||phone_number AS Contact_Details, salary 
     FROM employees 
       WHERE salary > 11000
        OR phone_number LIKE '______3%'
          ORDER BY first_name DESC;
GO
--19. From the following table, write a SQL query to find those employees whose first name contains a character 's' in the third position. Return first name, last name and department id.
SELECT first_name,last_name, department_id
 FROM employees
  WHERE first_name LIKE '__s%';
GO
--20. From the following table, write a SQL query to find those employees work in the departments that are not part of the department 50 or 30 or 80. Return employee_id, first_name,job_id, department_id.
SELECT employee_id, first_name, job_id, department_id
 FROM employees
  WHERE department_id NOT IN (50, 30, 80);
GO
--21. From the following table, write a SQL query to find the employees whose department numbers are included in 30, 40, or 90. Return employee id, first name, job id, department id. 
SELECT employee_id, first_name, job_id, department_id
 FROM employees
  WHERE department_id IN (30 , 40 , 90);
GO
--22. From the following table, write a SQL query to find those employees who worked more than two jobs in the past. Return employee id.
SELECT employee_id 
	FROM job_history 
		GROUP BY employee_id 
			HAVING COUNT(*) >=2;
GO
--23. From the following table, write a SQL query to count the number of employees, the sum of all salary, and difference between the highest salary and lowest salaries by each job id. Return job_id, count, sum, salary_difference.
SELECT job_id, COUNT(*), SUM(salary), 
	MAX(salary)-MIN(salary) AS salary_difference 
		FROM employees 
			GROUP BY job_id;
GO
--24. From the following table, write a SQL query to find each job ids where two or more employees worked for more than 300 days. Return job id. 
SELECT job_id 
	FROM job_history 
		WHERE end_date-start_date >300 
			GROUP BY job_id 
				HAVING COUNT(*)>=2;
GO
--25. From the following table, write a SQL query to count the number of cities in each country. Return country ID and number of cities. 
SELECT country_id,  COUNT(*)  
	FROM locations 
		GROUP BY country_id;
GO
--26. From the following table, write a SQL query to count the number of employees worked under each manager. Return manager ID and number of employees.
SELECT manager_id, COUNT(*) 
	FROM employees 
		GROUP BY manager_id;
GO
--27. From the following table, write a SQL query to find all jobs. Sort the result-set in descending order by job title. Return all fields.
SELECT * 
	FROM jobs 
		ORDER BY job_title DESC;
GO
--28. From the following table, write a SQL query to find all those employees who are either Sales Representatives or Salesmen. Return first name, last name and hire date.
SELECT first_name, last_name, hire_date
	FROM employees 
		WHERE job_id IN ('SA_REP', 'SA_MAN');
GO
--29. From the following table, write a SQL query to calculate the average salary of employees who receive a commission percentage for each department. Return department id, average salary. 
SELECT department_id, AVG(salary) 
	FROM employees 
		WHERE commission_pct IS NOT NULL 
			GROUP BY department_id;
GO
--30. From the following table, write a SQL query to find the departments where any manager manages four or more employees. Return department_id.
SELECT DISTINCT department_id
	FROM employees
		GROUP BY department_id, manager_id 
			HAVING COUNT(employee_id) >=4;
GO
--31. From the following table, write a SQL query to find the departments where more than ten employees receive commissions. Return department id.
SELECT department_id 
	FROM employees 
		WHERE commission_pct IS NOT NULL
			GROUP BY department_id 
				HAVING COUNT(commission_pct)>10;
GO
--32. From the following table, write a SQL query to find those employees who have completed their previous jobs. Return employee ID, end_date.
SELECT employee_id , MAX(end_date)
FROM job_history
WHERE employee_id IN (SELECT employee_id
FROM job_history
GROUP BY 1
HAVING COUNT(employee_id) > 1)
GROUP BY 1
GO
--33. From the following table, write a SQL query to find those employees who do not have commission percentage and have salaries between 7000, 12000 (Begin and end values are included.) and who are employed in the department number 50. Return all the fields of employees.
SELECT * 
	FROM employees 
		WHERE commission_pct IS NULL 
			AND salary BETWEEN 7000 AND 12000 
				AND department_id=50;
GO
--34. From the following table, write a SQL query to compute the average salary of each job ID. Exclude those records where average salary is on or lower than 8000. Return job ID, average salary.
SELECT job_id, AVG(salary) 
     FROM employees 
         GROUP BY job_id 
               HAVING AVG(salary)>8000;
GO
--35. From the following table, write a SQL query to find those job titles where maximum salary falls between 12000 and 18000 (Begin and end values are included.). Return job_title, max_salary-min_salary.
SELECT job_title, max_salary-min_salary AS salary_differences 
	FROM jobs 
		WHERE max_salary BETWEEN 12000 AND 18000;
GO
--36. From the following table, write a SQL query to find the employees whose first or last name begins with 'D'. Return first name, last name.  
SELECT first_name, last_name 
	FROM employees 
		WHERE  first_name  LIKE 'D%' 
			OR last_name LIKE 'D%';
GO
--37. From the following table, write a SQL query to find details of those jobs where the minimum salary exceeds 9000. Return all the fields of jobs.
SELECT * 
 FROM jobs 
  WHERE min_salary > 9000;
GO
--38. From the following table, write a SQL query to find those employees who joined after 7th September 1987. Return all the fields.
SELECT * 
 FROM employees  
   WHERE hire_date > '1987-09-07'
   GO