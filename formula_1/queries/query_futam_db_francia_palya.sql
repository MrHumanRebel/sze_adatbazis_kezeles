/*Számítsa ki, hogy eddig hány darab futamot tartottak francia versenypályán!*/
USE Formula_1
SELECT orszag, COUNT(futamok.futam_id) AS 'db'
FROM futamok INNER JOIN helyszin
ON helyszin.orszag='Franciaorszag' AND futamok.helyszin_id = helyszin.helyszin_id
GROUP BY orszag
