/* Listázza ki azokat a pilótákat, akik pole pozícióból kerültek dobogós helyre a 2019-es szezonban! */

USE Formula_1
SELECT DISTINCT keresztnev + ' ' +  vezeteknev AS 'Nev'
FROM versenyzok INNER JOIN helyezesek INNER JOIN szezonok
ON szezonok.ev = '2019' AND szezonok.szezon_id = helyezesek.szezon_id 
ON helyezesek.elert_helyezes <= 3 AND helyezesek.pole_poz = '1' AND versenyzok.versenyzo_id = helyezesek.versenyzo_id
