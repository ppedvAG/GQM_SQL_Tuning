--Fehlende Logins

--Backup einer DB auf einen anderen Server wiederherstellen
--user werden rstored aber nicht die Logins (sind ja in master auf dem anderen server)

--auf der DB mit verwaisten Usern
use northwind
sp_change_users_login 'Report'
sp_change_users_login 'Auto_fix' --Fehlendes Login mit neuen Kennwort angelegt
sp_change_users_login 'Update_one' --SID wird dem Login gleichgesetzt



--muss man sich besorgen...Googlen
sp_help_revlogin

--oder pragmatisch
--hätten wir alles mit Rollen erledigt..
