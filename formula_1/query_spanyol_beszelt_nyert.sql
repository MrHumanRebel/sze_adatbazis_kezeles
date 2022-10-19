USE Formula_1
SELECT DISTINCT vezeteknev + ' ' + keresztnev AS 'Nev', beszelt_nyelv
FROM versenyzok INNER JOIN helyezesek
ON versenyzok.versenyzo_id = helyezesek.versenyzo_id AND helyezesek.elert_helyezes = 1 AND helyezesek.elert_helyezes != '\N ' AND beszelt_nyelv='spanyol'
