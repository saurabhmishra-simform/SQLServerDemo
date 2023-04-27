SELECT * FROM tblEmployee;
SELECT * FROM tblDepartment;

SELECT EMP.ID,NAME,GENDER,SALARY,DEPT.DEPARTMENTNAME,COUNT(DEPT.DEPARTMENTNAME) OVER(PARTITION BY DEPARTMENTNAME) AS DEPRTMENTWISECOUNT
FROM tblEmployee EMP INNER JOIN tblDepartment DEPT ON EMP.DepartmentId = DEPT.ID;

-- CTE ON SINGLE TABLE
WITH tblNewEmployee
AS
(
	SELECT * FROM tblEmployee
)
SELECT * FROM tblNewEmployee;

-- CTE ON MULTIPLE TABLE
WITH CTE_EmployeeDetails
AS
(
	SELECT * FROM tblEmployee
),
CTE_DepartmentDetails
AS
(
	SELECT * FROM tblDepartment
)
SELECT e.Id,Name,Gender,Salary,DepartmentName FROM CTE_EmployeeDetails e INNER JOIN CTE_DepartmentDetails d ON E.DepartmentId = D.ID;

-- CTE Update
with CTE_Update_EmployeeGender
AS
(
	select e.Id,name,gender,salary,departmentname from tblEmployee e inner join tblDepartment d on e.DepartmentId = d.Id
)
update CTE_Update_EmployeeGender set Gender = 'Female' where ID = 1;

--CTe Update 
with CTE_Update_EmployeeGender
AS
(
	select e.Id,name,gender,salary,departmentname from tblEmployee e inner join tblDepartment d on e.DepartmentId = d.Id
)
update CTE_Update_EmployeeGender set Gender = 'Male' where ID = 1 and DepartmentName = 'IT';

--CTE Update 
with CTE_Update_EmployeeGender
AS
(
	select e.Id,name,gender,salary,departmentname from tblEmployee e inner join tblDepartment d on e.DepartmentId = d.Id
)
update CTE_Update_EmployeeGender set Gender = 'Male' where ID = 1 and DepartmentName = 'HR';