--BACKUP --RESTORE

--checkpoint bei Sicherung
--in unregel. Abst�ndigen

/*
Vollst�ndige
merkt sich: Dateien, Pfade, Gr��e, Inhalte (Seiten)
Checkpoint
Logfile bleibt unber�hrt, ausser...


Diff
seit letzter V Sicherung ge�nderte Seiten und Bl�cke
macht nix mit Logfile
Restore wird sicherer


Transaktionsprotokoll
sichert Anweisungen
Log leeren
auf Sekunde genau restoren


V TTT D TTT D TTT
V           D TTT
V xTT    TTT   TTT


Wer ist der schnellste Restore: V
wie lange dauert der Restore dieses "T": dauert solange wie die TX dauerten


--aber manchmal kann man das T nicht sichern!


RecoveryModels: 

Einfach
werden TX nach Commit rel schnell aus dem Log entfernt
weniger protkollieren
schneller
I, UP, D, BULK rudiment�r


Massenprotokoll
wird nix geleert, daher Backup LOG ist Pflicht


Vollst�ndig
wird mehr protkoll. auch BULG genauer, und auch IX
auf sek restore
Log sichern!
sicherer!




*/



--1: Wie lange darf die DB ausfallen?
--2: wie gro� darf der Datenverlust sein?


/*
DB: 200GB
Arbeitszeiten: 24h
@1: 15min
@2: 5min
*/

--alle 5min T
--alle 4 T eine D
--pro Tag ein V


--HADR: Spiegeln      Cluster     Hochverf�gbarkeitsgruppen




--VON EINF auf VOLL
--VOLL auf EINF


V  TTT D TTT D TTT : T alle 30min   15:30

--15:50
--Problem: 15:45

--einfach restore von 1530.. Datenverlust: ca 20min


--jetzt eine T Sicherung: 1550
--restore auf 1544   Datenverlust 6 min

--angenmommen: die TSicherung dauert 5 min (Ende 1555)
--im worst case: die Daten von 15550 bis 1555 weg

--user kicken, T sicherung machen, restore auf sekunden







