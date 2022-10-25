/*Listázza ki azon autókat, melyeknek teljesítménye 700 és 800 kW közé esik!*/
USE Formula_1
SELECT nev AS 'Auto neve', teljesitmeny AS 'Teljesitmeny'
FROM autok
WHERE teljesitmeny >= 700 AND teljesitmeny <= 800
ORDER BY 2 DESC
