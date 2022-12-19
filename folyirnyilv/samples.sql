SELECT EVDATUM_RD,ENEV_RD,FCIM_RD,EFIZDB_RD,EIRSZ_RD+','+ETELEP_RD+','+EUTCA_RD AS 'Cím', DATEDIFF(yy,ESZDAT_RD,GETDATE()) As 'Életkor'
FROM FTORZS INNER JOIN ELOFIZ on FTORZS.FAZON_RD=ELOFIZ.FAZON_RD INNER JOIN ETORZS on ETORZS.EKOD_RD=ELOFIZ.EKOD_RD
WHERE EVDATUM_RD>=GETDATE()

SELECT ETELEP_RD,count(*)
FROM ETORZS
GROUP BY ETELEP_RD

SELECT COUNT(*)
FROM ETORZS

SELECT EVDATUM_RD,ELOFIZ.EKOD_RD,ENEV_RD
FROM ETORZS INNER JOIN ELOFIZ on ETORZS.EKOD_RD=ELOFIZ.EKOD_RD
WHERE EVDATUM_RD>GETDATE()

SELECT FCIM_RD
FROM FTORZS
WHERE FAZON_RD NOT IN (SELECT fazon_rd FROM ELOFIZ)

SELECT FCIM_RD,FHDIj_RD
FROM FTORZS

SELECT TOP 1 ETELEP_RD, COUNT(etelep_RD)
FROM etorzs
group by etelep_rd

SELECT ENEV_RD, ETORZS.EKOD_RD, EVDATUM_RD
FROM ETORZS INNER JOIN ELOFIZ on ETORZS.EKOD_RD=ELOFIZ.EKOD_RD
WHERE DATEDIFF(mm,EVDATUM_RD, GETDATE())=0

SELECT AVG(FHDIJ_RD)
FROM FTORZS

SELECT distinct ENEV_RD, EIRSZ_RD+','+ETELEP_RD+','+EUTCA_RD
FROM ETORZS, FTORZS, ELOFIZ
WHERE ELOFIZ.EKOD_RD=ETORZS.EKOD_RD AND FTORZS.FAZON_RD=ELOFIZ.FAZON_RD and FTORZS.FTIPUS_RD=1

SELECT TOP 1 FCIM_RD, FTORZS.FAZON_RD, FHDIJ_RD, SUM(EFIZDB_RD)
FROM FTORZS full JOIN ELOFIZ on FTORZS.FAZON_RD=ELOFIZ.FAZON_RD
GROUP BY FTORZS.FAZON_RD, FCIM_RD, FHDIJ_RD
ORDER BY 4 DESC