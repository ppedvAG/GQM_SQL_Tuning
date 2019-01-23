--tempdb .. keine Sicherung
--msdb.. DB für den Agent (Jobs, Wartungspläne, SSIS Pakte, DBMail)
--    bei Änderung  Backup!!

--model.. Vorlage für neue DBs
-- bei Änderung ..script

USE [master]
GO
ALTER DATABASE [model] SET RECOVERY BULK_LOGGED WITH NO_WAIT
GO

--master
-- Herz (Login; DBs, Konfiguration) Backup!!


--systemddb sind komplett im Arsch!!
--SQL herunterfahren
--Vorlagen reinkopieren
--msdb:singleuser Modus.. dann restore per TSQL
--model: script laufen lassen
--master: Server Single User modus --startparameter -m


