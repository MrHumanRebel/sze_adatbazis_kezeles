USE Formula_1
SELECT teljesitmeny AS 'Teljesitmeny: ', nev AS 'Auto neve: '
FROM autok
WHERE teljesitmeny >=700 AND teljesitmeny <=800
ORDER BY 1 DESC
