/* 2. Számítsa ki, hány “napos” időben szervezett futam volt a Hungaroringen eddig? */

USE Formula_1
SELECT palyanev, COUNT(futamok.idojarasi_korulmeny_id) AS 'db'
FROM helyszin INNER JOIN futamok INNER JOIN idojarasi_korulmenyek
ON idojarasi_korulmenyek.nev='napos' AND idojarasi_korulmenyek.idojarasi_korulmeny_id = futamok.idojarasi_korulmeny_id
ON helyszin.palyanev='Hungaroring' AND futamok.helyszin_id = helyszin.helyszin_id
GROUP BY palyanev
