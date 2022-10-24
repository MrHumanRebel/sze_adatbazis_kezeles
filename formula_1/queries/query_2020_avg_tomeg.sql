/*A 2020-as versenyeken résztvevő autóknak átlagosan mekkora tömege van (karosszériatervezők alapján csoportosítva)?  */

USE Formula_1
SELECT konstruktorok.nev, AVG(CAST(autok.tömeg AS INT)) AS 'Atlagos tomeg:'
FROM konstruktorok INNER JOIN autok INNER JOIN helyezesek INNER JOIN szezon 
ON szezon.ev='2020' AND szezon.szezon_id=helyezesek.szezon_id
ON autok.auto_id = helyezesek.auto_id
ON autok.karosszeria_tervezo_id = konstruktorok.konstruktor_id
GROUP BY konstruktorok.nev
