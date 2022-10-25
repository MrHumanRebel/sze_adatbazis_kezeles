/*Melyik 5, a konstruktőrök alapítási helye szerinti ország rendelkezik a legtöbb győzelemmel? */

USE Formula_1
SELECT TOP 5 orszag, COUNT(helyezesek.elert_helyezes) AS 'Gyozelmek szama'
FROM konstruktorok INNER JOIN helyezesek
ON helyezesek.elert_helyezes = 1 AND konstruktorok.konstruktor_id = helyezesek.konstruktor_id
GROUP BY orszag
ORDER BY 2 DESC
