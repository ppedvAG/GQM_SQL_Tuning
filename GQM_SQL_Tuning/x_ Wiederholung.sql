--UNter der Haube

--Kopie der Kundeumsatz
select * into ku4 from kundeumsatz

--zusätzlich ID Spalte
alter table ku4 add kuid int identity


--HEAP--kein IX---> jede ABfrage wird ein Table SCAN


dbcc showcontig('ku4')
- Gescannte Seiten.............................: 42187
- Mittlere Seitendichte (voll).....................: 98.15%

set statistics io, time on
select * from ku4 where kuid = 100

select * from sys.dm_db_index_physical_stats(db_id(), 
											object_id('ku4'),
											NULL,NULL,
											'detailed')


	--forward Record Count.. durch CL IX eliminieren

--char(50)  varchar(50)



besser
select top 10 * from ku4 --HEAP
als
select top 10 * from ku4 --CL IX


select sp1, sp2 from tab where sp3 = wert

--Table SCAN  vs CL IX SCAN ---rel gegal

--CL IX SCAN vs IX SCAN --> IX SCAN ist besser, da weniger

--IX SCAN vs IX SEEK --> IX SEEK besser


select  companyname, city, country
from 
	ku4
where
		employeeid = 1
		or
		(freight <0.03
		and
		productid = 10)

--wie würde euer IX aussehen: NIX_PID   NIX_EID_i_cocicy

--immer zuerst GR IX anlegen
--Klammern setzen!!
--ein oder zwei IX

select * from t1

--PJK auf Bnr

--CL IX gut bei Bereichen , aber auch bei =   abe rnur 1x pro Tabelle
--NCL ist gut bei rel wenigen Ergebniszeilen, besonders bei = ... ID

--PK wird per default immer als cl ix eindeutig generiert
--am besten immer zuerst den CL IX setzten , dann den PK

---  A  B  C

--wieviele IX: ca 1000 
A
ABC
ACB
BCA
BAC
CAB
CBA


select * from sys.dm_db_index_usage_stats

select * from sys.indexes



select CIty, freight from ku3 where customerid = 'FISSA'


delete from ku3

select * from ku3


select * from sys.dm_db_column_store_row_group_physical_stats


select top 100000 * into ku5 from ku1

select * from ku5 where freight = 0.02 --wieviele DS kommen raus? 100
select * from ku5 where city = 'Berlin' -- 200
select * from ku5 where kuid = 50 --- ´1 oder 0

--wie das?? und warum ??


200MB HEAP
1 GR
2 NGR
363 MB

PLATZ: offline ohne Tempdb  860
	   online mit tempdb    1080


	   Ola Halléngren
















