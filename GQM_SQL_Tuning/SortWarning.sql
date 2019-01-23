create table tabSortWarning (id int identity, sp1 int, sp2 int)

declare @i as int = 0
while @i<1500
begin 
	insert into tabsortwarning values (@i, @i+1)
	set @i+=1
end

create nonclustered index ix1 on tabsortwarning(sp1)


select * from tabsortwarning where sp1 = 2 order by sp2

--1500: max 800 deltas (20%+500)

update top(799) tabsortwarning set sp1=2



