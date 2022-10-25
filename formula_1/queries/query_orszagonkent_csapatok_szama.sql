/*Országonként hány csapat indul az F1-en?*/
USE Formula_1
SELECT orszag AS 'Orszag', COUNT(DISTINCT nev) AS 'Csapatok szama'
FROM konstruktorok
GROUP BY orszag
ORDER BY 2 DESC
