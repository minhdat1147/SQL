--Create table Employee, Status = 1: are working
CREATE TABLE [dbo].[Employee](
	[EmpNo] [int] NOT NULL
,	[EmpName] [nchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
,	[BirthDay] [datetime] NOT NULL
,	[DeptNo] [int] NOT NULL
, 	[MgrNo] [int]
,	[StartDate] [datetime] NOT NULL
,	[Salary] [money] NOT NULL
,	[Status] [int] NOT NULL
,	[Note] [nchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
,	[Level] [int] NOT NULL
) ON [PRIMARY]

GO

ALTER TABLE Employee 
ADD CONSTRAINT PK_Emp PRIMARY KEY (EmpNo)
GO

ALTER TABLE [dbo].[Employee]  
ADD  CONSTRAINT [chk_Level] 
	CHECK  (([Level]=(7) OR [Level]=(6) OR [Level]=(5) OR [Level]=(4) OR [Level]=(3) OR [Level]=(2) OR [Level]=(1)))
GO
ALTER TABLE [dbo].[Employee]  
ADD  CONSTRAINT [chk_Status] 
	CHECK  (([Status]=(2) OR [Status]=(1) OR [Status]=(0)))

GO
ALTER TABLE [dbo].[Employee]
ADD Email NCHAR(30) 
GO

ALTER TABLE [dbo].[Employee]
ADD CONSTRAINT chk_Email CHECK (Email IS NOT NULL)
GO

ALTER TABLE [dbo].[Employee] 
ADD CONSTRAINT chk_Email1 UNIQUE(Email)

GO
ALTER TABLE Employee
ADD CONSTRAINT DF_EmpNo DEFAULT 0 FOR EmpNo

GO
ALTER TABLE Employee
ADD CONSTRAINT DF_Status DEFAULT 0 FOR Status

GO
CREATE TABLE [dbo].[Skill](
	[SkillNo] [int] IDENTITY(1,1) NOT NULL
,	[SkillName] [nchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
,	[Note] [nchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
ALTER TABLE Skill
ADD CONSTRAINT PK_Skill PRIMARY KEY (SkillNo)

GO
CREATE TABLE [dbo].[Department](
	[DeptNo] [int] IDENTITY(1,1) NOT NULL
,	[DeptName] [nchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
,	[Note] [nchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
ALTER TABLE Department
ADD CONSTRAINT PK_Dept PRIMARY KEY (DeptNo)

GO
CREATE TABLE [dbo].[Emp_Skill](
	[SkillNo] [int] NOT NULL
,	[EmpNo] [int] NOT NULL
,	[SkillLevel] [int] NOT NULL
,	[RegDate] [datetime] NOT NULL
,	[Description] [nchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
ALTER TABLE Emp_Skill
ADD CONSTRAINT PK_Emp_Skill PRIMARY KEY (SkillNo, EmpNo)
GO

ALTER TABLE Employee  
ADD  CONSTRAINT [FK_1] FOREIGN KEY([DeptNo])
REFERENCES Department (DeptNo)

GO
ALTER TABLE Emp_Skill
ADD CONSTRAINT [FK_2] FOREIGN KEY ([EmpNo])
REFERENCES Employee([EmpNo])

GO
ALTER TABLE Emp_Skill
ADD CONSTRAINT [FK_3] FOREIGN KEY ([SkillNo])
REFERENCES Skill([SkillNo])

GO

--2.Specify the name, email and department name of the employees that have been working at least six months.
SELECT E.EmpName, E.Email , D.DeptName 
FROM Employee AS E JOIN Department AS D ON E.DeptNo = D.DeptNo 
where GETDATE()- E.StartDate >6
go

--3.Specify the names of the employees whore have either ‘C++’ or ‘.NET’ skills.

SELECT EmpName
FROM Employee AS E LEFT JOIN Emp_Skill AS S ON E.EmpNo = S.EmpNo LEFT JOIN Skill AS SK ON S.SkillNo = SK.SkillNo
WHERE SK.SkillName ='C++' OR SK.SkillName = '.NET'
go

--4.List all employee names, manager names, manager emails of those employees.

SELECT E1.EmpName AS 'NHÂN VIÊN',E2.EmpName AS 'QUẢN LÝ', E2.Email 
FROM Employee AS E1  JOIN Employee AS E2 ON E1.EmpNo = E2.MgrNo 
go

--5.Specify the departments which have >=2 employees, print out the list of departments’ employees right after each department.
select D.DeptName, COUNT(*) AS'SỐ NHÂN VIÊN'
from Department as D LEFT JOIN Employee AS E ON D.DeptNo = E.DeptNo
GROUP BY D.DeptName
HAVING count(*) >=2

--6.List all name, email and number of skills of the employees and sort ascending order by employee’s name.
SELECT DISTINCT count(*) AS'SỐ KỸ NĂNG',E.EmpName, E.Email
FROM Employee AS E JOIN Emp_Skill AS S ON E.EmpNo = S.EmpNo JOIN Skill AS SK ON S.SkillNo = SK.SkillNo
GROUP BY SK.SkillName, E.EmpName, E.Email
--HAVING count(SK.SkillName) IN (S.EmpNo)
ORDER BY  count(*)