/*Számítsa ki a különböző időjárási viszonyok között rendezett futamok számát! */
USE Formula_1
SELECT idojarasi_korulmenyek.nev, COUNT(futamok.idojarasi_korulmeny_id) AS 'db'
FROM futamok INNER JOIN idojarasi_korulmenyek
ON futamok.idojarasi_korulmeny_id = idojarasi_korulmenyek.idojarasi_korulmeny_id
GROUP BY idojarasi_korulmenyek.nev
ORDER BY 2 DESC
