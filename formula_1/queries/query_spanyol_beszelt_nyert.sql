/*Mely spanyolajkú versenyzők nyertek már futamot?*/
USE Formula_1
SELECT DISTINCT keresztnev + ' ' + vezeteknev AS 'Nev', beszelt_nyelv
FROM versenyzok INNER JOIN helyezesek
ON helyezesek.elert_helyezes = 1 AND beszelt_nyelv='spanyol' AND versenyzok.versenyzo_id = helyezesek.versenyzo_id
