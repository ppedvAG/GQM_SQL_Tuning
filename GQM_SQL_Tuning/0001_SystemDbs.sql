--tempdb .. keine Sicherung
--msdb.. DB f�r den Agent (Jobs, Wartungspl�ne, SSIS Pakte, DBMail)
--    bei �nderung  Backup!!

--model.. Vorlage f�r neue DBs
-- bei �nderung ..script

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


