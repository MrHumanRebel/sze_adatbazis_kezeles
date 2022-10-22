/*
    Többtáblás lekérdezések
    2. Számítsa ki, hány “napos” időben szervezett futam volt a Hungaroringen eddig?
*/

USE Formula_1
SELECT helyszinek.nev, COUNT(futamok.idojarasi_korulmeny_id) AS 'db'
FROM helyszinek INNER JOIN futamok INNER JOIN idojarasi_korulmenyek
ON futamok.palyanev = "Hungaroring" AND idojarasi_korulmenyek.nev == "napos"
