--SystemDBs


--master
--Logins am SQL Server
--Konfiguration
--DBs


--model
--Vorlage f�r alle neuen DBs
--jede �nderung an Model hat AUswirkung auf alle neuen DBs
--RecoveryModel, Mxdop pro DB, Anfangsgr��en

--msdb
--Agent, Jobs, Wartungspl�ne, Emailsystem, Verlauf von Jobs


--tempdb
--#tabellen, ##tabellen, Zeilenversionierung, IX Erstellung
--schneller.. warum

--OPtimierung: so viele Datendateien wie Kerne (max 8)
--TRaceflags - T118  -T1119 im SQL COnfigration Manager setzen
--> DBDateien wachsen gleich und verwenden uniform Extents