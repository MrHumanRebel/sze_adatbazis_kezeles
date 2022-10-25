/*A Nürburgringen a 20. században hány különböző konstruktőr vonultatta fel a versenyautóit?  */

USE Formula_1
SELECT helyszin.palyanev, COUNT(DISTINCT konstruktorok.nev) AS 'db'
FROM szezonok INNER JOIN helyszinek INNER JOIN futamok INNER JOIN helyezesek INNER JOIN autok INNER JOIN konstruktorok
ON autok.karosszeria_tervezo_id = konstruktorok.konstruktor_id
ON autok.auto_id = helyezesek.auto_id
ON futamok.futam_id = helyezesek.futam_id
ON helyszinek.palyanev='Nurburgring' AND helyszinek.helyszin_id = futamok.helyszin_id
ON szezonok.ev BETWEEN '1900-01-01' AND '1999-12-31' AND szezonok.szezon_id = futamok.szezon_id
GROUP BY helyszinek.palyanev
