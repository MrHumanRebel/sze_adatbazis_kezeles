/*Listázza ki a 3 legsikeresebb (legtöbb futamot nyert) autómodellt!*/
USE Formula_1
SELECT TOP 3 autok.nev,COUNT(helyezesek.elert_helyezes) AS 'db'
FROM helyezesek INNER JOIN autok
ON helyezesek.elert_helyezes = 1 AND helyezesek.elert_helyezes != ' ' AND helyezesek.auto_id = autok.auto_id
GROUP BY autok.nev
ORDER BY 2 DESC
