USE Formula_1
SELECT vezeteknev + ' ' + keresztnev AS 'Nev'
FROM versenyzok
WHERE orszag = 'Nemetorszag'
