/*Melyik konstruktőr rendelkezik a legtöbb olyan versenyzővel, ahol a pilóta származási országa megegyezik a konstruktőr alapítási helyével?*/
USE Formula_1
SELECT TOP 1 versenyzok.orszag, konstruktorok.nev, COUNT(versenyzok.versenyzo_id) AS 'db'
FROM konstruktorok INNER JOIN versenyzok
ON versenyzok.orszag=konstruktorok.orszag
GROUP BY versenyzok.orszag, konstruktorok.nev
ORDER BY 3 DESC
