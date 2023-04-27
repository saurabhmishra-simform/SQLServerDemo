select * from tblEmployee;
--Simple Try-Catch block
Begin try
	Declare @age int;
	set @age = 'saurabh';
	if(@age>=18)
		print 'Person eligible for driving licence!';
	else 
		print 'Person is not eligible for driving licence!';
end try
Begin Catch
		raiserror('Invalid input',16,1);
end catch;
--Using function
CREATE FUNCTION Fn_GetEmployeeIncrimentSalaryWise(@Salary money) returns int 
As
Begin
	Declare @ImcrimentSalary int;
	set @ImcrimentSalary = (@Salary * 15)/100;
	return @ImcrimentSalary
end;
--try-catch block
Begin try
	select Id,Name,Gender,Salary,dbo.Fn_GetEmployeeIncrimentSalaryWise(Gender) as IncrimentSalaryAmount from tblEmployee;
end try
Begin catch
	Raiserror('Pass Invalid Data type in function',16,1);
end catch;

-- Try catch in procedure
CREATE PROC usp_divide(
    @a decimal,
    @b decimal,
    @c decimal output
) AS
BEGIN
    BEGIN TRY
        SET @c = @a / @b;
    END TRY
    BEGIN CATCH
        SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
    END CATCH
END;
--call procedure
DECLARE @r decimal;
EXEC usp_divide 'saurabh', 2, @r output;
PRINT @r;