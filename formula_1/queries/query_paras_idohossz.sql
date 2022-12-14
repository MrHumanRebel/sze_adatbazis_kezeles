/*Átlagosan milyen hosszú egy verseny adott pályán, “paras” időjárási viszonyok között?  */

USE Formula_1
SELECT helyszinek.palyanev, CAST(CAST(AVG(CAST(CAST(helyezesek.verseny_ido as datetime) as float)) as datetime) as time) AS 'Atlagos ido'
FROM helyezesek INNER JOIN helyszinek INNER JOIN futamok INNER JOIN idojarasi_korulmenyek
ON idojarasi_korulmenyek.nev = 'paras' AND idojarasi_korulmenyek.idojarasi_korulmeny_id = futamok.idojarasi_korulmeny_id
ON helyszinek.helyszin_id = futamok.helyszin_id
ON helyezesek.verseny_ido IS NOT NULL AND helyezesek.futam_id = futamok.futam_id
GROUP BY helyszinek.palyanev
