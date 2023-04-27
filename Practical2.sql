-- Create table Department with column name DepartmentId and DepartmentName
CREATE TABLE Department
(DepartmentId INT NOT NULL PRIMARY KEY IDENTITY(1,1),DepartmentName NVARCHAR(200) NOT NULL);

-- Create table Employee with column name EmployeeId, EmployeeName, DepartmentId,Experience and Salary
CREATE TABLE Employee
(EmployeeId INT NOT NULL PRIMARY KEY IDENTITY(1,1),EmployeeName NVARCHAR(500) NOT NULL,
DepartmentId INT NOT NULL  REFERENCES Department(DepartmentId),
Experience DECIMAL(3,1) CHECK(Experience>0),Salary MONEY CHECK(Salary>0));

-- Insert records in the Department table 
INSERT INTO Department VALUES
	('DotNet'),
	('Java'),
	('Python'),
	('Node'),
	('PHP');

-- Insert records in the Employee table
INSERT INTO Employee VALUES
	('Ram',3,3.1,50000),
	('Ned Flanders',2,1,30000),
	('Clancy Wiggum',1,2.3,50000),
	('Homer Simpson',3,10.5,90000),
	('Barney Gumble',1,5,75000),
	('Kuldeep Rana',4,4,65000),
	('Walter White',5,1,25000),
	('John Snow',3,8.8,90000),
	('Ramesh Kumar',5,2,80000),
	('Uncle Bob',4,3,60000),
	('Jimiy',2,5.9,40000);

-- Join query for display EmployeeId,EmployeeName and DepartmentName
SELECT EmployeeId,EmployeeName,DepartmentName FROM Employee Emp 
INNER JOIN Department Dept 
ON Emp.DepartmentId = Dept.DepartmentId;

-- Join query for display department wise employee count
SELECT DepartmentName,COUNT(DepartmentName) AS EmployeeCount FROM Employee Emp 
INNER JOIN Department Dept 
ON Emp.DepartmentId = Dept.DepartmentId 
GROUP BY DepartmentName;

-- Join query for display department wise maximum salary
SELECT DepartmentName,MAX(Salary) AS MaxSalary FROM Employee Emp 
INNER JOIN Department Dept 
ON Emp.DepartmentId = Dept.DepartmentId 
GROUP BY DepartmentName ORDER BY MaxSalary DESC;

-- Join query for display employee name in the ascending order of department name
SELECT EmployeeName,DepartmentName FROM Employee Emp 
INNER JOIN Department Dept 
ON Emp.DepartmentId = Dept.DepartmentId 
ORDER BY DepartmentName ASC;

/*Write a Query to display employeeName and grade where grade criteria is as below
if employee has more than 10 years of experience then grade is expert
if employee has experience between 7 to 10 years then its grade is advanced
if employee has experience between 5 to 7 years then its grade is intermediate
if employee has experience between 2 to 5 year then its grade is beginner
and for the rest of case display grade as novice*/
SELECT EmployeeName, 
	CASE 
		WHEN Experience > 10 THEN 'Expert'
		WHEN Experience > 7  THEN 'Advanced'
		WHEN Experience > 5  THEN 'Intermediate'
		WHEN Experience > 2 THEN 'Beginner'
		ELSE 'Novice'
	END AS grade 
FROM Employee;  







