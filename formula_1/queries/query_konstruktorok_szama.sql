/*Hány darab konstruktőr vesz részt az F1-ben?*/
USE Formula_1
SELECT DISTINCT COUNT(nev) AS 'Konstruktorok szama: '
FROM konstruktorok
