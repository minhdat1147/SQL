select * from sales.customers
go 

SELECT first_name, last_name, phone FROM sales.customers
GO

SELECT product_id, product_name, category_id, model_year,list_price 
FROM production.products
WHERE list_price >5000 
	AND
	model_year BETWEEN 2017 AND 2018
GO

SELECT C.first_name+''+C.last_name AS 'HỌ VÀ TÊN' 
INTO CUSTOMERLIST
FROM sales.customers AS C
GO
SELECT *
FROM CUSTOMERLIST

SELECT P.category_id ,AVG(list_price)
FROM production.products AS P
GROUP BY  P.category_id
HAVING AVG(list_price) BETWEEN 500 AND 1000

SELECT P.category_id , MAX(list_price) AS 'MAX LIST PRICE', MIN(list_price) AS'MAX LIST PRICE'
FROM production.products AS PS
GROUP BY P.category_id
HAVING MAX(list_price) >4000 OR MIN(list_price) <500
