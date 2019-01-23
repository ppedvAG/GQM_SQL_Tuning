

--Prozeduren

create proc gpname
as
--code


create proc gpname @par1 int, @par2 int
as
--select * from tab where sp = @par1 and sp2 > @par2

exec gpname 10, 20

--wofür Prozeduren?
--koplexe BI Logik
--wie Batchdatei unter Windows
-- der Plan wird gespeichert


--auf die Ku5


dbcc freeproccache

exec gpKundenSuche2 'ALFKI' --alle Zeilen mit Cusomterid = ALKFI
exec gpKundenSuche2 'A%' --alle Zeilen mit Cusomterid  , die A beginnen
exec gpKundenSuche2 '%' --alle Zeilen


create table it.mitarbeiter (itma int)
create table it.projekte (itpro int)
create proc gpkundensuche2 @kdid varchar(5)
as
IF %  code: procfüralle
else
procfür´wenige
select * from ku5 where customerid like @kdid --'A%----'
GO




set statistics io, time on

dbcc showcontig('ku5') --3825

exec gpKundenSuche2 '%' --559

select * from ku5 where customerid like '%'




declare @par1 as varchar(50)-- wird auf 25 geschätzt

select ... order by

Create proc xy @par1 bit
as
If 
	@par1 = 0 select ..... Orders
ELSE
	select ... customers




select * from Ku5 where freight = 1 --Autoparamtetriesieren


--sehr früh geht das nicht mehr
select * from customers c inner join orders o on c.customerid = o.customerid
where orderid = 10248

--besser durch Proc



--Sicht
create view v1
as
SELECT        Customers.CustomerID, Customers.CompanyName, Customers.ContactName, Customers.ContactTitle, Customers.City, Customers.Country, [Order Details].ProductID, [Order Details].Quantity, 
                         [Order Details].OrderID, Products.ProductName, Orders.OrderID AS Expr1, Orders.CustomerID AS Expr2, Orders.EmployeeID, Orders.OrderDate
FROM            Customers INNER JOIN
                         Orders ON Customers.CustomerID = Orders.CustomerID INNER JOIN
                         [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
                         Products ON [Order Details].ProductID = Products.ProductID



select * from v1

select country,companyname, count(*) from v1 where country = 'UK' group by country, companyname


select distinct companyname from v1 where country = 'UK'


select companyname from customers where country = 'UK'



--Sicht nie zweckentfremden!!


drop table t2

create table t2 (id int, stadt int, land int)


insert into t2
select 1,10,100
UNION
select 2,20,200
union
select 3,30,300

select * from t2

alter view v2 with schemabinding
as
select id, stadt, land from dbo.t2


select * from v2

alter table t2 add Fluss int
update t2 set fluss = id*1000


select * from t2

select * from v2

alter table t2 drop column Land


alter view v2 with schemabinding
as
select * from t2


--am besten immer mit Schemabinding

select f(sp), f(wert), from f(Wert) wher f(sp) > f(wert)



create function fRngSumme(@bestNr int) returns money
as
Begin
return (select sum(unitprice*quantity) from [order details] where orderid = @bestnr)
end+

select dbo.fRngsumme(10248)


alter table orders add RngSumme as dbo.fRngsumme(orderid)

select * from ku4 where freight >1




select * from mitarbeiter

use master

select * from orders

