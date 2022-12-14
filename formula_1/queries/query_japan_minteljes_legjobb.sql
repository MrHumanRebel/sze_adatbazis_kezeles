/*Japánul beszélő versenyzők közül ki érte el a legjobb helyezést a legkisebb teljesítménnyel (kW) rendelkező autóval?  */

USE Formula_1
SELECT TOP 1 keresztnev + ' ' + vezeteknev AS 'Nev', MIN(CAST(autok.teljesitmeny AS INT)) AS 'Minimum teljesitmeny', helyezesek.elert_helyezes
FROM versenyzok INNER JOIN autok INNER JOIN helyezesek
ON autok.auto_id = helyezesek.auto_id
ON versenyzok.beszelt_nyelv = 'japan' AND helyezesek.elert_helyezes IS NOT NULL AND versenyzok.versenyzo_id = helyezesek.versenyzo_id
GROUP BY keresztnev + ' ' + vezeteknev, helyezesek.elert_helyezes
ORDER BY 2 ASC, 3 ASC
