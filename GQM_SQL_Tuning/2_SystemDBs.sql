--SystemDBs


--master
--Logins am SQL Server
--Konfiguration
--DBs


--model
--Vorlage für alle neuen DBs
--jede Änderung an Model hat AUswirkung auf alle neuen DBs
--RecoveryModel, Mxdop pro DB, Anfangsgrößen

--msdb
--Agent, Jobs, Wartungspläne, Emailsystem, Verlauf von Jobs


--tempdb
--#tabellen, ##tabellen, Zeilenversionierung, IX Erstellung
--schneller.. warum

--OPtimierung: so viele Datendateien wie Kerne (max 8)
--TRaceflags - T118  -T1119 im SQL COnfigration Manager setzen
--> DBDateien wachsen gleich und verwenden uniform Extents