/* Ki volt a legeredményesebb konstruktőr csapatfőnöke a 2003 és 2007 közötti versenyszezonok intervallumában? */

USE Formula_1
SELECT TOP 1 konstruktorok.csapatvezeto, COUNT(helyezesek.elert_helyezes) AS 'db'
FROM konstruktorok INNER JOIN helyezesek INNER JOIN szezonok
ON szezonok.ev BETWEEN '2003-01-01' AND '2007-12-31'
ON helyezesek.elert_helyezes = 1 AND helyezesek.konstruktor_id = konstruktorok.konstruktor_id AND szezonok.szezon_id = helyezesek.szezon_id
GROUP BY konstruktorok.csapatvezeto
ORDER BY 2 DESC
