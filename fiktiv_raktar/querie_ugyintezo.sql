USE FiktivRakt
GO
SELECT TOP 5 UGYINTEZO.UGYINTEZO_ID, COUNT(MEGRENDELESEK.MEGRENDELES_ID) AS 'Megrendelesek', MEGRENDELESEK.MEGRENDELES_DATUMA
FROM UGYINTEZO INNER JOIN MEGRENDELESEK
ON UGYINTEZO.UGYINTEZO_ID = MEGRENDELESEK.UGYINTEZO_ID
GROUP BY UGYINTEZO.UGYINTEZO_ID
ORDER BY 2 DESC
/*NOT WORKING!*/