--Spielwiese
SELECT        Customers.CustomerID, Customers.CompanyName, Customers.ContactName, Customers.ContactTitle, Customers.City, Customers.Country, Orders.EmployeeID, Orders.OrderDate, Orders.Freight, Orders.ShipCity, 
                         Orders.ShipCountry, [Order Details].OrderID, [Order Details].ProductID, [Order Details].UnitPrice, [Order Details].Quantity, Employees.LastName, Employees.FirstName, Employees.BirthDate, 
                         Products.ProductName, Products.UnitsInStock
INTO KundeUmsatz
FROM            Customers INNER JOIN
                         Orders ON Customers.CustomerID = Orders.CustomerID INNER JOIN
                         Employees ON Orders.EmployeeID = Employees.EmployeeID INNER JOIN
                         [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
                         Products ON [Order Details].ProductID = Products.ProductID


select * from kundeumsatz


insert into kundeumsatz
select * from kundeumsatz

--jetzt haben wir 1 Mio dumme Daten



select * into ku1 from kundeumsatz


--eindeutiger Wert dazu
alter table ku1 add kuid int identity


--was haben wir aktuell: HEAP
set statistics io, time on
select kuid from ku1 where kuid = 100 --TABLE SCAN: 56469


--NIX_KUID. IX Seek mit 3 Seiten
select kuid from ku1 where kuid = 100 

--IX Seek mit Lookup... am besten Lookup eliminieren
select kuid, city from ku1 where kuid = 100 


--NIX_KUID_CITY
select kuid, city from ku1 where kuid = 100 --IX Seek 3 Seiten


--NIX_KUID_inkl_CITY
select kuid, city, country, freight from ku1 where kuid = 100 --IX Seek 3 Seiten



select shipcity, sum(freight) from ku1
where 
	employeeid = 4
group by shipcity

--NIX_emid_inkl_sci_fr

--NIX_Filter  auf City= 'berlin' weniger Ebenen = 2.. also besser
select freight, orderdate from ku1 where kuid < 100 and city = 'Berlin'


--Was ist ne Sicht?
--gespeicherte Abfrage
--werden wie Tabellen verwendet
--Sichten enthalten keine DAten

create view vBerlinKunden
as
select * from customers where city = 'Berlin'


select * from vBerlinKunden



select country, count(*) from ku1 
group by country
--, CPU-Zeit = 610 ms, verstrichene Zeit = 106 ms.
-- 8245

--Sicht erstellen
create view vxy
as
select country, count(*)  as Anzahl from ku1 
group by country


select * from vxy



alter view vxy with schemabinding --jetzt musst exakt arbeiten
as
select country, count_big(*)  as Anzahl from dbo.ku1 
group by country


--Columnstore

select * into ku2 from ku1
select * into ku3 from ku1

--ku2 und ku3 neu.. keine IX weit und breit

select top 3 * from ku2
--NIX_Pid_incl_city_Fr
select city, country,sum(freight) from ku2
where productid =77
group by city, country



select city, country,sum(freight) from ku3
where unitprice < 5
group by city, country

select * from sys.dm_db_column_store_row_group_physical_stats

update ku3 set city = 'BGH' where kuid < 10
















