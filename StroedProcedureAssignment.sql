select * from employee;

--Assicement #1 Accroding to name
create procedure USP_GetEmployeeDetail
@CheckName varchar(20)
AS
Begin 
	if EXISTS (select name from Employee where name = @CheckName)
		Select * from Employee;
End;
--Second way
create procedure USP_GetEmployeeDetail
@CheckName varchar(20)
AS
Begin 
	SELECT * FROM Employee WHERE EXISTS (select name from Employee where name = @CheckName);
End;
--Procedure Call
USP_GetEmployeeDetail 'John Doe';

-- Assignment #2 Department Count duplicate with simple query
select Id,Name,Department,Salary,Gender,Age,City,Count(Department) over(Partition by Department) as DepartmentWiseCount from Employee;

-- Assignment #2 Department Count duplicate with function
create function Fn_GetEmployeeDepartmentWise(@DepartmentName varchar(30)) returns int
As
Begin
	Declare @CountDepartment int;
	select @CountDepartment = COUNT(Department) from Employee where Department = @DepartmentName;
	return @CountDepartment;
End;
-- Function call 
select Id,Name,Department,Salary,Gender,Age,City,dbo.Fn_GetEmployeeDepartmentWise(Department) as EmpCount from Employee;
--Assignment 2 with stroed procedure
create procedure USP_GetDuplicateCountWithDepartmentWise
As
Begin
	select Id,Name,Department,Salary,Gender,Age,City,Count(Department) over(Partition by Department) as DepartmentWiseCount from Employee;
End;
-- call procedure
USP_GetDuplicateCountWithDepartmentWise;
--multi table print 
create procedure USP_GetAllDetailsForMultipleTable
@GetTableValue int
As
Begin
	if(@GetTableValue  = 1)
		select * from Employee;
	else if(@GetTableValue = 2)
		select * from Student;
	else if(@GetTableValue = 3)
		select * from Projects;
End;
-- call pro
USP_GetAllDetailsForMultipleTable 1;