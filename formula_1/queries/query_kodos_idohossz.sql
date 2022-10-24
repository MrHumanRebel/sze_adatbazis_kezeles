/*Átlagosan milyen hosszú egy verseny adott pályán, “kodos” időjárási viszonyok között?  */

USE Formula_1
SELECT helyszin.palyanev, AVG(CAST(futamok.ido AS INT)) AS 'Atlagos ido:'
FROM helyszin INNER JOIN futamok INNER JOIN idojarasi_korulmenyek
ON idojarasi_korulmenyek.nev = 'kodos' AND idojarasi_korulmenyek.idojarasi_korulmeny_id=futamok.idojarasi_korulmeny_id
ON helyszin.helyszin_id= futamok.helyszin_id
GROUP BY helyszin.palyanev
