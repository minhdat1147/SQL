USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = N'bookstore_db')
BEGIN
    ALTER DATABASE bookstore_db SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE bookstore_db;
END
GO

CREATE DATABASE bookstore_db;
GO

USE bookstore_db;
GO

CREATE TABLE Categories (
    CategoryId INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName NVARCHAR(50) NOT NULL,
    Description NVARCHAR(MAX)
);
GO
CREATE TABLE Books (
    BookId INT IDENTITY(1,1) PRIMARY KEY,
    CategoryId INT NOT NULL,
    BookTitle NVARCHAR(50) NOT NULL,
    BookAuthor NVARCHAR(50) NOT NULL,
    Publisher NVARCHAR(50) NOT NULL,
    PublicationDate DATE,

    CONSTRAINT FK_Books_Categories FOREIGN KEY (CategoryId) REFERENCES Categories(CategoryId)
);
GO
ALTER TABLE BOOKS
ADD price FLOAT

GO
CREATE TABLE Customers (
    CustomerId INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(50) NOT NULL,
    Phone NVARCHAR(15),
    Address NVARCHAR(MAX)
);
GO
CREATE TABLE Rentals (
    RentalId INT IDENTITY(1,1) PRIMARY KEY,
    CustomerId INT NOT NULL,
    BookId INT NOT NULL,
    RentalDate DATE NOT NULL,
    ReturnDate DATE NOT NULL,
    CONSTRAINT FK_Rentals_Customers FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId),
    CONSTRAINT FK_Rentals_Books FOREIGN KEY (BookId) REFERENCES Books(BookId),
    CONSTRAINT CHK_Rentals_Dates CHECK (ReturnDate >= RentalDate)
);
GO
--1.Add at least 8 records into each created table.

INSERT INTO Categories 
(CategoryName,Description) VALUES
(N'THIẾU NHI',N' KHÔNG CÓ GÌ...'),
(N'TOÁN HỌC',N' KHÔNG CÓ GÌ...'),
(N'TIN HỌC',N' KHÔNG CÓ GÌ...'),
(N'VĂN HỌC',N' KHÔNG CÓ GÌ...'),
(N'TRUYỆN TRANH',N' KHÔNG CÓ GÌ...'),
(N'KIẾM HIỆP',N' KHÔNG CÓ GÌ...'),
(N'TÌNH CẢM',N' KHÔNG CÓ GÌ...'),
(N'TRUYỆN MA',N' KHÔNG CÓ GÌ...'),
(N'KINH TẾ',N' KHÔNG CÓ GÌ...')
GO
INSERT INTO Customers
(FirstName, LastName,Email, Phone,Address) VALUES
(N'NGUYỄN VĂN', N'A','nguyenvana@gmail.com',0123456789, N'TP.HCM'),
(N'NGUYỄN VĂN', N'B','nguyenvanB@gmail.com',0123456789, N'TP.HCM'),
(N'NGUYỄN VĂN', N'C','nguyenvanC@gmail.com',0123456789, N'TP.HCM'),
(N'NGUYỄN VĂN', N'D','nguyenvanD@gmail.com',0123456789, N'TP.HCM'),
(N'NGUYỄN VĂN', N'E','nguyenvanE@gmail.com',0123456789, N'TP.HCM'),
(N'NGUYỄN VĂN', N'F','nguyenvanF@gmail.com',0123456789, N'TP.HCM'),
(N'NGUYỄN VĂN', N'G','nguyenvanG@gmail.com',0123456789, N'TP.HCM'),
(N'NGUYỄN VĂN', N'H','nguyenvanH@gmail.com',0123456789, N'TP.HCM'),
(N'NGUYỄN VĂN', N'I','nguyenvanI@gmail.com',0123456789, N'TP.HCM')
GO
SET DATEFORMAT DMY;
INSERT INTO Books
(CategoryId, BookTitle, BookAuthor, Publisher, PublicationDate,price) VALUES
(1, N'SÁCH ĐẸP',N'NGUYEN VAN A',N'KIM ĐỒNG','20-10-2021',50000),
(2, N'SÁCH B',N'NGUYEN VAN B',N'KIM ĐỒNG B','20-10-2021',20000),
(3, N'SÁCH C',N'NGUYEN VAN C',N'KIM ĐỒNG C','20-10-2021',100000),
(4, N'SÁCH D',N'NGUYEN VAN D',N'KIM ĐỒNG D','20-10-2021',250000),
(5, N'SÁCH E',N'NGUYEN VAN E',N'KIM ĐỒNG S','20-10-2021',75000),
(6, N'SÁCH F',N'NGUYEN VAN F',N'KIM ĐỒNG C','20-10-2021',52000),
(7, N'SÁCH G',N'NGUYEN VAN G',N'KIM ĐỒNG S','20-10-2021',80000),
(8, N'SÁCH H',N'NGUYEN VAN H',N'KIM ĐỒNG A','20-10-2021',250000)
GO
SET DATEFORMAT DMY;
INSERT INTO Rentals
(CustomerId,BookId,RentalDate,ReturnDate) VALUES
(1,2,'24-06-2022','24-07-2022'),
(1,2,'24-06-2022','24-07-2022'),
(1,3,'24-06-2022','24-07-2022'),
(2,2,'24-06-2022','24-07-2022'),
(3,4,'24-06-2022','24-07-2022'),
(4,5,'24-06-2022','24-07-2022'),
(5,6,'24-06-2022','24-07-2022'),
(6,7,'24-06-2022','24-07-2022'),
(7,2,'24-06-2022','24-07-2022'),
(8,6,'24-06-2022','24-07-2022'),
(2,3,'24-06-2022','24-07-2022'),
(3,7,'24-06-2022','24-07-2022'),
(2,3,'24-06-2022','24-07-2022'),
(4,2,'24-06-2022','24-07-2022')

--2.     Retrieve the information of all books whose price is less than or equal to 100,000 VND.
SELECT *
FROM Books
WHERE price <=100000
GO

--3.     Retrieve the number of books in stock for each book category.
SELECT C.CategoryName,COUNT(*) AS 'BOOK NUMBER'
FROM Categories as C JOIN Books AS B ON C.CategoryId = B.CategoryId
GROUP BY C.CategoryName
GO

--4.     Retrieve the total value of all borrowed books in the year 2022.
SELECT SUM(B.price) AS 'TOTAL VALUE BOOKS'
FROM Books AS B JOIN Rentals AS R ON B.BookId = R.BookId
WHERE YEAR(R.RentalDate) = 2022
GO

--5.     Retrieve the information of all books borrowed by a reader named "Nguyen Van A" and already returned.

SELECT B.*
FROM BOOKS AS B LEFT JOIN Rentals AS R ON B.BookId = R.BookId JOIN Customers AS C ON R.CustomerId = C.CustomerId
WHERE C.FirstName+' '+LastName = N'NGUYỄN VĂN A' AND R.RentalDate IS NOT NULL AND GETDATE() >R.ReturnDate
GO

--6.     Retrieve the information of all books whose title starts with "The" or ends with "ing".
SELECT *
FROM Books
WHERE BookTitle LIKE 'The%' or  BookTitle LIKE '%ing'

--7.     Update all records has value less than 100.000 VND to 100.000 VND.
update Books
set price = 100000
where price < 100000
go
select *
from Books
go