--der Rest der Zeile ein KOmmentar

/*
alles
ist 

ein KOmmentar

*/

select 
* --Kommentar
from


sysobjects


--BasicSettings

/*

CPU




RAM (Arbeitsspeicher= Puffercache)
Min 0				Garantie für den SQL Server...Max Arbeitssatz (Taskmanager)
Max 2,1Mrd GB       Garantie für die anderen (OS - 2 bis 8 GB))





HDD
Pfade für DB

DBs bestehen aus mind. 1 Datei (Snapshot)
aber normalerweise aus mind 2 Dateien
- Datendatei .mdf (weitere .ndf)
- Transaktionsprotokoll  ( .ldf)


--TRENNE LOG VON DATEN!!!  Physikalisch
-


*/





--Wieviele CPUS verwendet SQL für eine Abfrage?
--1 , soviel wie er braucht

use nwindbig
--nimmt mehr cpus her... gelber Kreis mit 2 Pfeilen
select sum(freight) as SUmme , country from customers c 
inner join orders o on c.customerid = o.customerid
group by country option (maxdop 6)

set statistics io, time on --Anzahl der Seiten, Dauer der CPU und Gesamtdauer in ms

--gilt nur in dieser Verbindung

--, CPU-Zeit = 6922 ms, verstrichene Zeit = 1436 ms.
--Paral. macht hier Sinn, da wir CPU > Dauer haben

--mit 1 CPU: , CPU-Zeit = 4094 ms, verstrichene Zeit = 5284 ms.
--mit 6 CPUs: , CPU-Zeit = 4985 ms, verstrichene Zeit = 853 ms.



--Guter Defaultwert für OLTP
EXEC sys.sp_configure N'cost threshold for parallelism', N'25'
GO
EXEC sys.sp_configure N'max degree of parallelism', N'4'
GO
RECONFIGURE WITH OVERRIDE
GO

--auch pro DB..seit SQL 2016 ca
USE [NwindBig]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 2;
GO


--nicht mehr als 8 cpus für MAXDOP, ansonsten 50%

-------------------------------------
--DATENBANKEN
-------------------------------------
Create Database GQM

--Wie groß ist die DB?   zwischen 5 und 16MB 
--Was wenn 10 GB rein müssen?  (MDF/LDF) entweder 1MB/10%  -- 64MB/64MB


use gqm
GO

set statistics io, time off
GO

create table t1 (id int identity, sp1 char(4100));
GO

--20000 Datensätze reinhämmern
insert into t1 
select '##'
GO 20000
--17 Sek, 26 Sek, 36Sek, 29 Sek, 32 Sek, 56 Sek 

--Wie groß ist t1? 20000 * 4k = 80 MB
--doppelt soviele Daten wie wir rechnerisch haben dürften!

--Anfangsgröße vorgeben spart Zeit:
-- in 3 ´Jahren!


create table t2 (id int identity, sp1 char(4100));
GO

--20000 Datensätze reinhämmern
insert into t2 
select '##'
GO 20000

--mit Bulk


select * into t3 from t1













