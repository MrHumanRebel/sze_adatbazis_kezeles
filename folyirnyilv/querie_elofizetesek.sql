USE FolyirNyilv
GO
/*------------------------------------------------------------------------*/
SELECT ETORZS.ENEV AS 'Elofizeto neve', FTORZS.FCIM AS 'Folyoirat cime', ELOFIZ.EFIZDB AS 'Rendelt db'
FROM ETORZS INNER JOIN FTORZS INNER JOIN ELOFIZ
/*------------------------------------------------------------------------*/
ON EKOD = ELOFIZ.EKOD 
ON FTORZS.FAZON = ELOFIZ.FAZON
/*------------------------------------------------------------------------*/
GO