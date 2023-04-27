select * from Employee;

-- Create Stroed Procedure
create procedure USP_GetEmployee
As
Begin
	select Id,Name,Department,Salary from Employee;
End;

--Call procedure
USP_GetEmployee;

-- Get structure of Procedure
sp_helptext USP_GetEmployee;

-- Alter procedure
Alter procedure USP_GetEmployee
As
Begin
	select Id,Name,Department,Salary from Employee order by Department;
End;

-- Create Prameterized stroed procedure
create procedure USP_GetEmployeeByDepartmentAndSalary
@DepartmentName varchar(30),
@Salary decimal
As
Begin
	select Id,Name,Department,Salary from Employee where Department = @DepartmentName and Salary = @Salary;
End;

-- Call the parameterized procedure
USP_GetEmployeeByDepartmentAndSalary 'IT',50000;

-- error of converting data type
USP_GetEmployeeByDepartmentAndSalary 50000,'IT';

USP_GetEmployeeByDepartmentAndSalary @Salary = 50000,@DepartmentName = 'IT';

-- Encrypting procedure
Alter procedure USP_GetEmployeeByDepartmentAndSalary
@DepartmentName varchar(30),
@Salary decimal
with Encryption
As
Begin
	select Id,Name,Department,Salary from Employee where Department = @DepartmentName and Salary = @Salary;
End;

--The text for object 'USP_GetEmployeeByDepartmentAndSalary' is encrypted.
sp_helptext USP_GetEmployeeByDepartmentAndSalary;

-- Create stored procedure with output prameter
create procedure USP_GetCountofEmployeeByDepartment
@Department varchar(30),
@EmployeeCount int output
As
Begin
	select @EmployeeCount = Count(Id) from Employee where Department = @Department;
End;

--Call output prameter procedure
Declare @TotalCount int;
Execute USP_GetCountofEmployeeByDepartment 'IT',@TotalCount out;
print @TotalCount;

sp_help Employee;
-- Return references of the table
sp_depends Employee;

-- Create procedure with output prameter and return value
create procedure USP_GetEmployeeMaxSalaryDepartmentWise
@Department varchar(30)
As
Begin
	return (select  Max(Salary) from Employee where Department = @Department);
End;

Declare @MaxEmployeeSalary int;
Execute @MaxEmployeeSalary  = USP_GetEmployeeMaxSalaryDepartmentWise 'IT';
Print @MaxEmployeeSalary;