/*Melyik 950 kilogramm feletti autóval nyertek már bajnokságot Belgiumban? */

USE Formula_1
SELECT DISTINCT autok.nev, autok.tömeg
FROM autok INNER JOIN helyezesek INNER JOIN futamok INNER JOIN helyszin
ON helyszin.orszag='Belgium' AND futamok.helyszin_id = helyszin.helyszin_id
ON helyezesek.futam_id = futamok.futam_id AND helyezesek.elert_helyezes = 1 AND helyezesek.elert_helyezes != '\N ' 
ON autok.tömeg > 950 AND autok.auto_id=helyezesek.auto_id
