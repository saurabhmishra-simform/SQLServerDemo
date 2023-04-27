--Using Top Clause
select top 5 * from tblEmployee;

--Using Row_Number() method
select ROW_NUMBER() over(order by Id) as RNId,* from tblEmployee;

--Using CTE
with CTE_Rank
As
(
	select ROW_NUMBER() over(order by Id) as RNId,* from tblEmployee
)
select * from CTE_Rank;

--Using OFFSET Clause
select * from tblEmployee order by Id asc OFFSET 0 rows fetch next 6 rows only;