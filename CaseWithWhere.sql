select Name,case 
			when Salary > 8000 Then 'expert'
			when Salary between 6000 and 8000 Then 'advanced'
			when Salary between 4000 and 6000 then 'intermediate'
			when Salary between 2000 and 4000 then 'beginner'
		Else 'Novice'
		End as Experience,Salary from tblEmployee where DepartmentId=1;

select * from tblEmployee;
-- Case when clause with where clause
select Id,Name,Salary from tblEmployee where tblEmployee.Id =
		case 
			when Salary > 8000 Then 10
			when Salary > 6000 Then 6 
			when Salary > 4000 Then 8
			when Salary > 1000 Then 7
		END;

