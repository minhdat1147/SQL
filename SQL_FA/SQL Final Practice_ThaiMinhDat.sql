USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = N'BankDatabase')
BEGIN
    ALTER DATABASE BankDatabase SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE BankDatabase;
END
GO
--a Create a database called BankDatabase, then create the tables with the most appropriate column constraints & types.
CREATE DATABASE BankDatabase;
GO

USE BankDatabase;
GO

CREATE TABLE Person (
PersonId		int PRIMARY KEY IDENTITY(1, 1),
Title			nvarchar(5) NULL,
FirstName		nvarchar(50) NOT NULL,
LastName		nvarchar(50) NOT NULL,
DateOfBirth		date NOT NULL,
Email			nvarchar(50) NOT NULL,
Debt			decimal(18,3)
)



CREATE TABLE ContactDetails (
ContactId		int PRIMARY KEY IDENTITY(1, 1),
PersonId		int FOREIGN KEY REFERENCES Person(PersonId),
ContactType		nvarchar(50),
PhoneNumber		nvarchar(50),
[Address]		nvarchar(2000) NOT NULL,
OfficeTimeOnly	bit,
)


CREATE TABLE CreditCard (
CreditCardID	int PRIMARY KEY IDENTITY(1, 1),
CardType		nvarchar(50),
CardNumber		nvarchar(10) NOT NULL,
ExpMonth		int NOT NULL,
ExpYear			int NOT NULL
)

CREATE TABLE PersonCreditCard (
PersonId		int FOREIGN KEY REFERENCES Person(PersonId),
CreditCardID	int FOREIGN KEY REFERENCES CreditCard(CreditCardID),
ModifiedDate	date NOT NULL,
IsOwner			bit,
Balance			decimal(18,3)
)

ALTER TABLE CreditCard
ADD CONSTRAINT CardTypeCheck CHECK (CardType IN ('SuperiorCard', 'Vista', 'Distinguish', 'ColonialVoice'))
----------------------------------------------Questions and answer----------------------------------------------------------------

--b Write query to add 10 records for each table

----------------PERSON TABLE
SET DATEFORMAT DMY;
Insert into Person(FirstName,LastName,DateOfBirth,Email,Debt) values
(N'Thái',N'ĐẠT','04/07/2000',N'MINHDAT072000@GMAIL.COM',1),
(N'RADER',N'PETER','05/07/1997',N'perter@corp.com',2),
(N'MOKEDY',N'LUFFY','05/07/1987',N'mokedy@gmail.com',3),
(N'NGUYỄN',N'NGÂN','05/08/1997',N'nguyenngan@gmail.com',2),
(N'TRƯƠNG',N'THANH','05/07/2002',N'TRUONGTRANH@GMAIL.com',1),
(N'BÉ HỘT',N'LU','05/07/1997',N'BEHOTLU@GMAIL.com',0),
(N'ANH BA',N'TRÀ CÚ','05/07/1989',N'ANHBA@GMAIL.com',0),
(N'NGUYỄN',N'A','05/07/2001',N'NGUYENA@GMAIL.com',2),
(N'NGUYỄN',N'NHÂN','05/04/2001',N'NGUYENNHAN@GMAIL.com',2),
(N'TRẦN',N'C','05/02/1997',N'TRANC@GMAIL.com',5),
(N'TRẦN',N'D','05/02/1997',N'TRAND@GMAIL.com',6),
(N'NGUYỄN',N'E','05/02/1996',N'NGUYENE@GMAIL.com',2),
(N'LÊ',N'HÀ','05/02/1995',N'LEHA@GMAIL.com',0)
-----------------TABLE ContactDetails
INSERT INTO ContactDetails(PersonId, ContactType, PhoneNumber,[Address],OfficeTimeOnly) VALUES
(1,N'EMAIL AND PHONE','0907626002',N'TP.HCM',8),
(2,N'EMAIL AND PHONE','0123456789',N'BẾN TRE',8),
(3,N'EMAIL AND PHONE','0907626022',N'TP.HCM',9),
(4,N'EMAIL AND PHONE','0123232323',N'TP.HCM',8),
(5,N'EMAIL AND PHONE','0907621212',N'TP.HCM',8),
(6,N'EMAIL AND PHONE','0907155222',N'TP.HCM',7),
(7,N'EMAIL AND PHONE','0907626562',N'TP.HCM',8),
(8,N'EMAIL AND PHONE','0907626126',N'TP.HCM',8),
(10,N'EMAIL AND PHONE','0907622322',N'TP.HCM',8),
(9,N'EMAIL AND PHONE','0907622202',N'TP.HCM',8),
(11,N'EMAIL AND PHONE','0955552202',N'TP.HCM',8),
(12,N'EMAIL AND PHONE','0127622202',N'TP.HCM',7),
(13,N'EMAIL AND PHONE','0907625502',N'TP.HCM',10)

-------------------------TABLE CreditCard
INSERT INTO CreditCard (CardType,CardNumber,ExpMonth,ExpYear) VALUES
(N'SuperiorCard','200153633',5,2022),
(N'Vista','200153633',6,2022),
(N'SuperiorCard','2001125225',2,2023),
(N'Vista','222223522',2,2022),
(N'ColonialVoice','203632252',3,2020),
(N'SuperiorCard','200151255',5,2021),
(N'ColonialVoice','2052233666',2,2019),
(N'SuperiorCard','20013666',5,2021),
(N'Distinguish','25893366',5,2022),
(N'Distinguish','200633666',5,2021)


---------------------------TABLE PersonCreditCard 
SET DATEFORMAT DMY;
INSERT INTO PersonCreditCard (PersonId,CreditCardID,ModifiedDate,IsOwner,Balance) VALUES
(1,11,'25/04/2022',2,3),
(1,5,'25/02/2022',1,5),
(2,12,'12/04/2021',2,1),
(3,4,'15/02/2021',2,3),
(4,11,'20/08/2020',2,3),
(5,6,'21/06/2022',2,3),
(7,3,'05/03/2022',2,3),
(9,9,'02/12/2022',2,3),
(5,8,'12/02/2019',2,3),
(13,10,'13/05/2022',2,3),
(11,3,'13/05/2022',2,3),
(10,11,'13/05/2022',2,3),
(8,7,'13/05/2022',2,3)

--C: Write a query to select information from Person table with Debt >0. The query returns top 3 people have highest debt
SELECT TOP(3) WITH TIES Debt, PersonId, FirstName +' '+ LastName AS 'FULL NAME'
FROM Person
WHERE Debt > 0
ORDER BY Debt DESC
GO

--D: write a query to find phone number and address of person. The person has email address peter@corp.com. 
SELECT  C.PhoneNumber, C.Address
FROM Person AS P JOIN ContactDetails AS C ON P.PersonId = C.PersonId
WHERE Email = N'perter@corp.com'
GO

--E: Write query to extend CreditCard for 6 months.The query update ExpMonth, ExpYear by adding 6 month from curent value of CreditCard belong to person with PersonId = 13

UPDATE CreditCard
SET  ExpMonth = ExpMonth +6 /*ExpYear = CONVERT(float, ExpYear +0.5)*/
WHERE CreditCardID IN(SELECT C.CreditCardID
						FROM CreditCard AS C JOIN PersonCreditCard AS PCC ON C.CreditCardID = PCC.CreditCardID JOIN Person AS P ON P.PersonId = PCC.PersonId
						WHERE P.PersonId = 13)
GO
SELECT *
FROM CreditCard AS C JOIN PersonCreditCard AS PCC ON C.CreditCardID = PCC.CreditCardID JOIN Person AS P ON P.PersonId = PCC.PersonId
						WHERE P.PersonId = 13
GO
--F: Write a query to select[full name],[total balance]. The [full name] is combined from the LastName and FirstName column with format: FirstName, a space, LastName.
--The [Total balance] is total of all [Balance] in PersonCreditCard that belong to his or her. The query returns data if [Total balance] is negative only.

SELECT P.FirstName +' '+ P.LastName AS 'FULL NAME', SUM(PCC.Balance) AS 'TOTAL BALANCE'
FROM Person AS P JOIN PersonCreditCard AS PCC ON P.PersonId = PCC.PersonId
GROUP BY PCC.Balance, P.FirstName, P.LastName
GO
