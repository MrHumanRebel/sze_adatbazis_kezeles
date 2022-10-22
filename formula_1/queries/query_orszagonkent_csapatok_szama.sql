/*Országonként hány csapat indul az F1-en?*/
USE Formula_1
SELECT DISTINCT COUNT(nev) AS 'Csapatok szama: ', orszag AS 'Orszag neve: '
FROM konstruktorok
GROUP BY orszag
ORDER BY 1 DESC
