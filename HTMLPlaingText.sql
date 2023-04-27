create table tblHTML(HTML nvarchar(500) not null);

insert into tblHTML values
	('<html><b> Intime0 </b><b> outtime1 </b><i> Intime2 </i><i> outtime3 </i><u> intime4 </u><u> outtime5 </u></html>');

select * from tblHTML;
--Create Function
create function FN_GetHTMLText(@Html nvarchar(100))returns nvarchar(200) as
begin
	declare @htmltext varchar(100);
	SELECT @htmltext = CAST(@Html AS XML).value('.[1]', 'nvarchar(500)') ;
	return @htmltext;
end;
--Call Function
select dbo.Fn_GetHTMLText(Html) from tblHTML;

SELECT CAST(Html AS XML) as Html from tblHTML ;

declare @set nvarchar(500);
set @set = '';
select @set = dbo.Fn_GetHTMLText(Html) from tblHTML;
print @set;

