USE FolyirNyilv
GO
/*------------------------------------------------------------------------*/
SELECT ENEV, FCIM, EFIZDB, EIRSZ + ' ' + EUTCA AS Cím
FROM FTORZS INNER JOIN ETORZS INNER JOIN ELOFIZ
ON ETORZS.EKOD = ELOFIZ.EKOD 
ON FTORZS.FAZON = FTORZS.FAZON
/*------------------------------------------------------------------------*/
WHERE EVDATUM >= GETDATE() AND EKDATUM <= GETDATE()