/*Melyik 950 kilogramm feletti autóval nyertek már bajnokságot Belgiumban? */

USE Formula_1
SELECT DISTINCT autok.nev, autok.tomeg
FROM autok INNER JOIN helyezesek INNER JOIN futamok INNER JOIN helyszinek
ON helyszinek.orszag = 'Belgium' AND futamok.helyszin_id = helyszinek.helyszin_id
ON helyezesek.elert_helyezes = 1 AND helyezesek.futam_id = futamok.futam_id
ON autok.tomeg > 950 AND autok.auto_id=helyezesek.auto_id
