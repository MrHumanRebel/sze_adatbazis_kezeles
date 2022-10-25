/*Listázza ki a Németországból származó versenyzőket!*/
USE Formula_1
SELECT keresztnev + ' ' + vezeteknev AS 'Nev'
FROM versenyzok
WHERE orszag = 'Nemetorszag'
