select * from tblEmployee;

select E.Name as EmployeeName,M.Name as ManagerName from tblEmployee E left join tblEmployee M on E.DepartmentId = M.ID;

select E.Name as EmployeeName,M.Name as ManagerName from tblEmployee E inner join tblEmployee M on E.DepartmentId = M.ID;

select E.Name as EmployeeName,M.Name as ManagerName from tblEmployee E right join tblEmployee M on E.DepartmentId = M.ID;

