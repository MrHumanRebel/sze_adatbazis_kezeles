/*Melyik 5, a konstruktőrök alapítási helye szerinti ország rendelkezik a legtöbb győzelemmel? */
USE Formula_1
SELECT TOP 5 orszag, COUNT(helyezesek.elert_helyezes) AS 'Nyeresek száma: '
FROM konstruktorok INNER JOIN helyezesek
ON konstruktorok.konstruktor_id = helyezesek.konstruktor_id AND helyezesek.elert_helyezes = 1 AND helyezesek.elert_helyezes != '\N '
GROUP BY orszag
ORDER BY 2 DESC
