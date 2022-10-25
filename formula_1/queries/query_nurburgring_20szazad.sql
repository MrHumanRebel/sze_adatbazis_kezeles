/*A Nürburgringen a 20. században hány különböző konstruktőr vonultatta fel a versenyautóit?  */

USE Formula_1
SELECT helyszin.palyanev, COUNT(konstruktorok.nev) AS 'db'
FROM szezonokINNER JOIN helyezesek INNER JOIN helyszinek INNER JOIN futamok INNER JOIN autok INNER JOIN konstruktorok
ON autok.karosszeria_tervezo_id = konstruktorok.konstruktor_id
ON autok.auto_id = helyezesek.auto_id
ON helyszin.palyanev='Nurburgring' AND helyszin.helyszin_id = futamok.helyszin_id
ON futamok.futam_id = helyezesek.futam_id
ON (szezon.ev BETWEEN 1900 AND 1999) AND szezon.szezon_id = futamok.szezon_id

