--1. From the following tables write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city.
SELECT salesman.name AS "Salesman",
customer.cust_name, customer.city 
FROM salesman,customer 
WHERE salesman.city=customer.city;
GO
--2. From the following tables write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.
SELECT  a.ord_no,a.purch_amt,
b.cust_name,b.city 
FROM orders a,customer b 
WHERE a.customer_id=b.customer_id 
AND a.purch_amt BETWEEN 500 AND 2000;
GO
--3. From the following tables write a SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission.
SELECT a.cust_name AS "Customer Name", 
a.city, b.name AS "Salesman", b.commission 
FROM customer a 
INNER JOIN salesman b 
ON a.salesman_id=b.salesman_id
GO
--4. From the following tables write a SQL query to find salespeople who received commissions of more than 12 percent from the company. Return Customer Name, customer city, Salesman, commission. 
SELECT C.cust_name, C.city, C.salesman_id, S.commission
FROM customer AS C JOIN salesman AS S ON S.salesman_id  = C.salesman_id 
WHERE commission >.12
GO
--5. From the following tables write a SQL query to locate those salespeople who do not live in the same city where their customers live and have received a commission of more than 12% from the company. Return Customer Name, customer city, Salesman, salesman city, commission. 
SELECT a.cust_name AS "Customer Name", 
a.city, b.name AS "Salesman", b.city,b.commission  
FROM customer a  
INNER JOIN salesman b  
ON a.salesman_id=b.salesman_id 
WHERE b.commission>.12 
AND a.city != b.city
GO
--6. From the following tables write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission
SELECT a.ord_no,a.ord_date,a.purch_amt,
b.cust_name AS "Customer Name", b.grade, 
c.name AS "Salesman", c.commission 
FROM orders a 
INNER JOIN customer b 
ON a.customer_id=b.customer_id 
INNER JOIN salesman c 
ON a.salesman_id=c.salesman_id
GO
--7. Write a SQL statement to join the tables salesman, customer and orders so that the same column of each table appears once and only the relational rows are returned.
SELECT * 
FROM orders 
NATURAL JOIN customer  
NATURAL JOIN salesman
GO
--8. From the following tables write a SQL query to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted by ascending customer_id. 
SELECT a.cust_name,a.city,a.grade, 
b.name AS "Salesman",b.city 
FROM customer a 
LEFT JOIN salesman b 
ON a.salesman_id=b.salesman_id 
order by a.customer_id
GO
--9. From the following tables write a SQL query to find those customers with a grade less than 300. Return cust_name, customer city, grade, Salesman, salesmancity. The result should be ordered by ascending customer_id. 
SELECT a.cust_name,a.city,a.grade, 
b.name AS "Salesman", b.city 
FROM customer a 
LEFT OUTER JOIN salesman b 
ON a.salesman_id=b.salesman_id 
WHERE a.grade<300 
ORDER BY a.customer_id
GO

--10. Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to determine whether any of the existing customers have placed an order or not.
SELECT a.cust_name,a.city, b.ord_no,
b.ord_date,b.purch_amt AS "Order Amount" 
FROM customer a 
LEFT OUTER JOIN orders b 
ON a.customer_id=b.customer_id 
order by b.ord_date;
GO
--11. SQL statement to generate a report with customer name, city, order number, order date, order amount, salesperson name, and commission to determine if any of the existing customers have not placed orders or if they have placed orders through their salesman or by themselves.
SELECT a.cust_name,a.city, b.ord_no,
b.ord_date,b.purch_amt AS "Order Amount", 
c.name,c.commission 
FROM customer a 
LEFT OUTER JOIN orders b 
ON a.customer_id=b.customer_id 
LEFT OUTER JOIN salesman c 
ON c.salesman_id=b.salesman_id;

--12. Write a SQL statement to generate a list in ascending order of salespersons who work either for one or more customers or have not yet joined any of the customers. 
SELECT a.cust_name,a.city,a.grade, 
b.name AS "Salesman", b.city 
FROM customer a 
RIGHT OUTER JOIN salesman b 
ON b.salesman_id=a.salesman_id 
ORDER BY b.salesman_id;
GO
--13. From the following tables write a SQL query to list all salespersons along with customer name, city, grade, order number, date, and amount.
SELECT a.cust_name,a.city,a.grade, 
b.name AS "Salesman", 
c.ord_no, c.ord_date, c.purch_amt 
FROM customer a 
RIGHT OUTER JOIN salesman b 
ON b.salesman_id=a.salesman_id 
RIGHT OUTER JOIN orders c 
ON c.customer_id=a.customer_id;
GO
--14. Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer. The customer may have placed, either one or more orders on or above order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier.
SELECT a.cust_name,a.city,a.grade, 
b.name AS "Salesman", 
c.ord_no, c.ord_date, c.purch_amt 
FROM customer a 
RIGHT OUTER JOIN salesman b 
ON b.salesman_id=a.salesman_id 
LEFT OUTER JOIN orders c 
ON c.customer_id=a.customer_id 
WHERE c.purch_amt>=2000 
AND a.grade IS NOT NULL;
GO
--15.For those customers from the existing list who put one or more orders, or which orders have been placed by the customer who is not on the list, create a report containing the customer name, city, order number, order date, and purchase amount
SELECT a.cust_name,a.city, b.ord_no,
b.ord_date,b.purch_amt AS "Order Amount" 
FROM customer a 
LEFT OUTER JOIN orders b 
ON a.customer_id=b.customer_id;
GO
--16. Write a SQL statement to generate a report with the customer name, city, order no. order date, purchase amount for only those customers on the list who must have a grade and placed one or more orders or which order(s) have been placed by the customer who neither is on the list nor has a grade.
SELECT a.cust_name,a.city, b.ord_no,
b.ord_date,b.purch_amt AS "Order Amount" 
FROM customer a 
FULL OUTER JOIN orders b 
ON a.customer_id=b.customer_id 
WHERE a.grade IS NOT NULL;
GO
--17. Write a SQL query to combine each row of the salesman table with each row of the customer table. 
SELECT * 
FROM salesman a 
CROSS JOIN customer b;
GO
--18. Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for all customers and vice versa for that salesperson who belongs to that city.
SELECT * 
FROM salesman a 
CROSS JOIN customer b 
WHERE a.city IS NOT NULL;
GO
--19. Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for every customer and vice versa for those salesmen who belong to a city and customers who require a grade. 
SELECT * 
FROM salesman a 
CROSS JOIN  customer b 
WHERE a.city IS NOT NULL 
AND b.grade IS NOT NULL;
GO
--20. Write a SQL statement to make a Cartesian product between salesman and customer i.e. each salesman will appear for all customers and vice versa for those salesmen who must belong to a city which is not the same as his customer and the customers should have their own grade.
SELECT * 
FROM salesman a 
CROSS JOIN customer b 
WHERE a.city IS NOT NULL 
AND b.grade IS NOT NULL 
AND  a.city<>b.city;
GO
--21. From the following tables write a SQL query to select all rows from both participating tables as long as there is a match between pro_com and com_id.
SELECT *
   FROM item_mast 
   INNER JOIN company_mast
   ON item_mast.pro_com= company_mast.com_id; 
GO
--22. Write a SQL query to display the item name, price, and company name of all the products.
SELECT item_mast.pro_name, pro_price, company_mast.com_name
   FROM item_mast 
     INNER JOIN company_mast
        ON item_mast.pro_com = company_mast.com_id; 
GO
--23. From the following tables write a SQL query to calculate the average price of items of each company. Return average value and company name. 
SELECT AVG(pro_price), company_mast.com_name
   FROM item_mast INNER 
     JOIN company_mast
        ON item_mast.pro_com= company_mast.com_id
           GROUP BY company_mast.com_name; 
GO
--24. From the following tables write a SQL query to calculate and find the average price of items of each company higher than or equal to Rs. 350. Return average value and company name.
 SELECT AVG(pro_price), company_mast.com_name
   FROM item_mast INNER JOIN company_mast
   ON item_mast.pro_com= company_mast.com_id
   GROUP BY company_mast.com_name
   HAVING AVG(pro_price) >= 350;
GO
--25. From the following tables write a SQL query to find the most expensive product of each company. Return pro_name, pro_price and com_name. 
SELECT A.pro_name, A.pro_price, F.com_name
   FROM item_mast A INNER JOIN company_mast F
   ON A.pro_com = F.com_id
     AND A.pro_price =
     (
       SELECT MAX(A.pro_price)
         FROM item_mast A
         WHERE A.pro_com = F.com_id
     )
GO
--26. From the following tables write a SQL query to display all the data of employees including their department.
SELECT emp_idno, A.emp_fname AS "First Name", emp_lname AS "Last Name",
    B.dpt_name AS "Department", emp_dept, dpt_code,  dpt_allotment
     FROM emp_details A 
      INNER JOIN emp_department B
        ON A.emp_dept = B.dpt_code;
GO
--27. From the following tables write a SQL query to display the first and last names of each employee, as well as the department name and sanction amount. 
SELECT emp_details.emp_fname AS "First Name", emp_lname AS "Last Name", 
    emp_department.dpt_name AS "Department", 
     dpt_allotment AS "Amount Allotted"
       FROM emp_details 
         INNER JOIN emp_department
           ON emp_details.emp_dept = emp_department.dpt_code;
GO
--28. From the following tables write a SQL query to find the departments with budgets more than Rs. 50000 and display the first name and last name of employees.
SELECT emp_details.emp_fname AS "First Name", emp_lname AS "Last Name"
  FROM emp_details 
    INNER JOIN emp_department
        ON emp_details.emp_dept = emp_department.dpt_code
    AND emp_department.dpt_allotment > 50000;
GO
--29. From the following tables write a SQL query to find the names of departments where more than two employees are employed. Return dpt_name.
SELECT emp_department.dpt_name
  FROM emp_details 
     INNER JOIN emp_department
       ON emp_dept =dpt_code
        GROUP BY emp_department.dpt_name
          HAVING COUNT(*) > 2;
GO

---------------------------------------------------------------------------------------------------------------------------
--1. From the following tables, write a SQL query to find the first name, last name, department number, and department name for each employee. 
SELECT E.first_name , E.last_name , 
       E.department_id , D.department_name 
        FROM employees E 
         JOIN departments D 
          ON E.department_id = D.department_id;
GO
--2. From the following tables, write a SQL query to find the first name, last name, department, city, and state province for each employee.
SELECT E.first_name,E.last_name, 
   D.department_name, L.city, L.state_province
     FROM employees E 
      JOIN departments D  
        ON E.department_id = D.department_id  
          JOIN locations L
           ON D.location_id = L.location_id;
GO
--3. From the following table, write a SQL query to find the first name, last name, salary, and job grade for all employees.
SELECT E.first_name, E.last_name, E.salary, J.grade_level
 FROM employees E 
   JOIN job_grades J
     ON E.salary BETWEEN J.lowest_sal AND J.highest_sal;
GO
--4. From the following tables, write a SQL query to find all those employees who work in department ID 80 or 40. Return first name, last name, department number and department name. 
SELECT E.first_name , E.last_name , 
       E.department_id ,  D.department_name 
         FROM employees E 
         JOIN departments D 
          ON E.department_id = D.department_id 
          AND E.department_id IN (80 , 40)
           ORDER BY E.last_name;
GO
--5. From the following tables, write a SQL query to find those employees whose first name contains the letter ‘z’. Return first name, last name, department, city, and state province.
SELECT E.first_name, E.last_name, D.department_id, D.department_name 
 FROM employees E 
   RIGHT OUTER JOIN departments D
     ON E.department_id = D.department_id;
GO
--6. From the following tables, write a SQL query to find all departments, including those without employees. Return first name, last name, department ID, department name.
SELECT E.first_name, E.last_name, D.department_id, D.department_name 
 FROM employees E 
   RIGHT OUTER JOIN departments D
     ON E.department_id = D.department_id;
GO
--7. From the following table, write a SQL query to find the employees who earn less than the employee of ID 182. Return first name, last name and salary. 
SELECT E.first_name, E.last_name, E.salary 
  FROM employees E 
   JOIN employees S
     ON E.salary < S.salary 
      AND S.employee_id = 182;
GO
--8. From the following table, write a SQL query to find the employees and their managers. Return the first name of the employee and manager.
SELECT E.first_name AS "Employee Name", 
   M.first_name AS "Manager"
     FROM employees E 
       JOIN employees M
         ON E.manager_id = M.employee_id;
GO
--9. From the following tables, write a SQL query to display the department name, city, and state province for each department. 
SELECT D.department_name , L.city , L.state_province
  FROM  departments D 
    JOIN locations L 
      ON  D.location_id = L.location_id;
GO
--10. From the following tables, write a SQL query to find out which employees have or do not have a department. Return first name, last name, department ID, department name.
SELECT E.first_name, E.last_name, E.department_id, D.department_name 
  FROM employees E 
   LEFT OUTER JOIN departments D 
     ON E.department_id = D.department_id;
GO
--11. From the following table, write a SQL query to find the employees and their managers. Those managers do not work under any manager also appear in the list. Return the first name of the employee and manager.
SELECT E.first_name AS "Employee Name",
   M.first_name AS "Manager"
    FROM employees E 
      LEFT OUTER JOIN employees M
       ON E.manager_id = M.employee_id;
GO
--12. From the following tables, write a SQL query to find the employees who work in the same department as the employee with the last name Taylor. Return first name, last name and department ID.
SELECT E.first_name, E.last_name, E.department_id 
 FROM employees E 
   JOIN employees S
     ON E.department_id = S.department_id
       AND S.last_name = 'Taylor';
GO
--13. From the following tables, write a SQL query to find all employees who joined on or after 1st January 1993 and on or before 31 August 1997. Return job title, department name, employee name, and joining date of the job.
SELECT job_title, department_name, first_name || ' ' || last_name AS Employee_name, start_date 
	FROM job_history 
		JOIN jobs USING (job_id) 
			JOIN departments USING (department_id) 
				JOIN  employees USING (employee_id) 
					WHERE start_date>='1993-01-01' AND start_date<='1997-08-31';
GO
--14. From the following tables, write a SQL query to calculate the difference between the maximum salary of the job and the employee's salary. Return job title, employee name, and salary difference.
SELECT job_title, first_name || ' ' || last_name AS Employee_name, 
	max_salary-salary AS salary_difference 
	FROM employees 
		NATURAL JOIN jobs;
GO
--15. From the following table, write a SQL query to calculate the average salary, the number of employees receiving commissions in that department. Return department name, average salary and number of employees. 
SELECT department_name, AVG(salary), COUNT(commission_pct) 
	FROM departments 
		JOIN employees USING (department_id) 
GROUP BY department_name;
GO
--16. From the following tables, write a SQL query to calculate the difference between the maximum salary and the salary of all the employees who work in the department of ID 80. Return job title, employee name and salary difference.
SELECT job_title, first_name || ' ' || last_name AS Employee_name, 
	max_salary-salary AS salary_difference
	FROM employees 
		NATURAL JOIN jobs 
			WHERE department_id  = 80;
GO
--17. From the following table, write a SQL query to find the name of the country, city, and departments, which are running there.
SELECT country_name,city, department_name 
	FROM countries 
		JOIN locations USING (country_id) 
			JOIN departments USING (location_id);
GO
--18. From the following tables, write a SQL query to find the department name and the full name (first and last name) of the manager.
SELECT department_name, first_name || ' ' || last_name AS name_of_manager
	FROM departments D 
		JOIN employees E 
			ON (D.manager_id=E.employee_id);
GO
--19. From the following table, write a SQL query to calculate the average salary of employees for each job title.
SELECT job_title, AVG(salary) 
	FROM employees 
		NATURAL JOIN jobs 
			GROUP BY job_title;
GO
--20. From the following table, write a SQL query to find the employees who earn $12000 or more. Return employee ID, starting date, end date, job ID and department ID.
SELECT a.*
	FROM  job_history a 
		JOIN employees m 
			ON (a.employee_id = m.employee_id)
WHERE salary >= 12000;
GO
--21. From the following tables, write a SQL query to find out which departments have at least two employees. Group the result set on country name and city. Return country name, city, and number. 
SELECT country_name,city, COUNT(department_id)
	FROM countries 
		JOIN locations USING (country_id) 
		JOIN departments USING (location_id) 
WHERE department_id IN 
    (SELECT department_id 
		FROM employees 
	 GROUP BY department_id 
	 HAVING COUNT(department_id)>=2)
GROUP BY country_name,city;
GO
--22. From the following tables, write a SQL query to find the department name, full name (first and last name) of the manager and their city. 
SELECT department_name, first_name || ' ' || last_name AS name_of_manager, city 
	FROM departments D 
		JOIN employees E 
			ON (D.manager_id=E.employee_id) 
				JOIN locations L USING (location_id);
GO
--23. From the following tables, write a SQL query to calculate the number of days worked by employees in a department of ID 80. Return employee ID, job title, number of days worked.
SELECT employee_id, job_title, end_date-start_date DAYS 
	FROM job_history 
		NATURAL JOIN jobs 
			WHERE department_id=80;
GO
--24. From the following tables, write a SQL query to find full name (first and last name), and salary of all employees working in any department in the city of London.
SELECT first_name || ' ' || last_name AS Employee_name, salary
	FROM employees 
		JOIN departments USING (department_id) 
		JOIN  locations USING (location_id) 
	WHERE  city = 'London';
GO
--25. From the following tables, write a SQL query to find full name (first and last name), job title, start and end date of last jobs of employees who did not receive commissions.
SELECT CONCAT(e.first_name, ' ', e.last_name) AS Employee_name,
       j.job_title,
       h.*
FROM employees e
JOIN
  (SELECT MAX(start_date),
          MAX(end_date),
          employee_id
   FROM job_history
   GROUP BY employee_id) h ON e.employee_id=h.employee_id
JOIN jobs j ON j.job_id=e.job_id
WHERE e.commission_pct = 0;
GO
--26. From the following tables, write a SQL query to find the department name, department ID, and number of employees in each department. 
SELECT d.department_name,
       e.*
FROM departments d
JOIN
  (SELECT count(employee_id),
          department_id
   FROM employees
   GROUP BY department_id) e USING (department_id);;
GO
--27. From the following tables, write a SQL query to find out the full name (first and last name) of the employee with an ID and the name of the country where he/she is currently employed.
SELECT first_name || ' ' || last_name 
AS Employee_name, employee_id, country_name 
FROM employees 
JOIN departments 
USING(department_id) 
JOIN locations 
USING( location_id) 
JOIN countries 
USING ( country_id);
GO