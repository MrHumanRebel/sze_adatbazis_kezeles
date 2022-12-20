USE master
GO
/*------------------------------------------------------------------------*/
ALTER SERVER ROLE [sysadmin] ADD MEMBER [G14\Daniel]
/*------------------------------------------------------------------------*/
GO
IF EXISTS (
	SELECT name
		FROM sys.databases
		WHERE name = N'FolyirNyilv'
)
ALTER DATABASE FolyirNyilv SET single_user WITH ROLLBACK immediate
DROP DATABASE FolyirNyilv
CREATE DATABASE FolyirNyilv
GO
USE FolyirNyilv
GO
/*------------------------------------------------------------------------*/
CREATE TABLE dbo.FTORZS(
    FAZON int IDENTITY(1,1) NOT NULL,
    FTIPUS nvarchar(20) NOT NULL CONSTRAINT Params_Ftipus CHECK (FTIPUS in ('napi','családi','szakmai tudományos','egyéb')),
    FCIM nvarchar(50) NOT NULL,
    FKIAD nvarchar(50) NOT NULL,
    FHDIJ char(6) NOT NULL CONSTRAINT Params_Fhdij CHECK(FHDIJ >= 100 AND FHDIJ < 100000),
    CONSTRAINT PK_FTORZS PRIMARY KEY (FAZON ASC)
)
GO
CREATE TABLE dbo.ETORZS(
    EKOD int IDENTITY(1,10) NOT NULL,
    ENEV nvarchar(50) NOT NULL,
    ESZDAT date NOT NULL CONSTRAINT Params_Eszdat CHECK(DATEDIFF(yy,ESZDAT,GETDATE()) >= 18 ),
    EIRSZ char(4) NOT NULL CONSTRAINT Params_Eirsz CHECK (EIRSZ LIKE '[1-9][0-9][0-9][0-9]' AND CAST(EIRSZ AS smallint) >= 1011 AND CAST(EIRSZ AS smallint) <= 9985),
    ETELEP nvarchar(50) NOT NULL,
    EUTCA nvarchar(50) NOT NULL,
    CONSTRAINT PK_ETORZS PRIMARY KEY (EKOD ASC)
)
CREATE INDEX Idx_Enev
ON ETORZS (ENEV)
GO
CREATE TABLE dbo.ELOFIZ(
    EKOD int NOT NULL,
    EKDATUM date NOT NULL DEFAULT GETDATE(),
    EVDATUM date NOT NULL CONSTRAINT Params_Evdatum CHECK(DATEADD(mm,3,EVDATUM) >= GETDATE() OR DATEADD(mm,6,EVDATUM) >= GETDATE() OR DATEADD(mm,12,EVDATUM) >= GETDATE()),
    FAZON int NOT NULL,
    EFIZDB char(4) NOT NULL CONSTRAINT Params_Efizdb CHECK(EFIZDB < 1000 AND EFIZDB > 0))
    ALTER TABLE ELOFIZ ADD CONSTRAINT FK_EKOD FOREIGN KEY (EKOD) REFERENCES ETORZS(EKOD)
    ON UPDATE CASCADE
    ON DELETE CASCADE
    ALTER TABLE ELOFIZ ADD CONSTRAINT FK_FAZON FOREIGN KEY (FAZON) REFERENCES FTORZS(FAZON)
    ON UPDATE CASCADE
    ON DELETE CASCADE
GO
/*------------------------------------------------------------------------*/
INSERT INTO FTORZS (FTIPUS, FCIM, FKIAD, FHDIJ)
VALUES ('napi', 'Egy macska élete', 'MacskaAdó Kft. & Kis Pista', '50000');
GO
INSERT INTO FTORZS (FTIPUS, FCIM, FKIAD, FHDIJ)
VALUES ('családi', 'Egy macska élete a családban', 'MacskaSzedő Kft. & Nagy Béla', '60000');
GO
INSERT INTO FTORZS (FTIPUS, FCIM, FKIAD, FHDIJ)
VALUES ('szakmai tudományos', 'Egy macska élete a tudományban', 'MacskaKenő Kft. & Közepes János', '70000');
GO
/*------------------------------------------------------------------------*/
INSERT INTO ETORZS(ENEV, ESZDAT, EIRSZ, ETELEP, EUTCA)
VALUES ('Bakfi Lajos', '2000-01-01', '9172', 'Kiskunhalas', 'Nagy Jenő utca 672');
GO
INSERT INTO ETORZS(ENEV, ESZDAT, EIRSZ, ETELEP, EUTCA)
VALUES ('Szekunder Pali', '1999-02-01', '9173', 'Nagykunhalas', 'Kis Anna utca 6942');
GO
INSERT INTO ETORZS(ENEV, ESZDAT, EIRSZ, ETELEP, EUTCA)
VALUES ('Nagyatádi István', '1959-09-01', '9170', 'Középkunhalas', 'Óriás Péter utca 1');
GO
/*------------------------------------------------------------------------*/
INSERT INTO ELOFIZ (EKOD, EVDATUM, FAZON, EFIZDB)
VALUES ('11', '2022-12-01', '1', '10')
GO
INSERT INTO ELOFIZ (EKOD, EVDATUM, FAZON, EFIZDB)
VALUES ('21', '2024-12-01', '2', '20')
GO
INSERT INTO ELOFIZ (EKOD, EVDATUM, FAZON, EFIZDB)
VALUES ('31', '2032-12-01', '3', '600')
GO


/*
CONSTRAINT Only_Alphabets CHECK (sample NOT LIKE '%[^A-Z ]%')
CONSTRAINT Only_Neptun CHECK (sample LIKE '[A-Z0-9][A-Z0-9][A-Z0-9][A-Z0-9][A-Z0-9][A-Z0-9]')
CONSTRAINT Only_TelNum CHECK (sample like '[+][3][6][237][0][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
CONSTRAINT Only_SubjectNum CHECK (sample like '[A-Z][A-Z][0-9][0-9][0-9]')
CONSTRAINT Only_1_to_5  CHECK (sample BETWEEN 1 AND 5)
CONSTRAINT Only_1_to_5  CHECK (sample  >= 1 AND sample <= 5)
CONSTRAINT Only_in_list CHECK (sample IN 'sample1','sample2','sample3','sample4''))
CONSTRAINT Only_HU_Postal_Code  CHECK (sample LIKE '[1-9][0-9][0-9][0-9]' AND CAST(sample AS smallint) >= 1011 AND CAST(sample AS smallint) <= 9985)
CONSTRAINT Only_Webpage CHECK(sample LIKE '[www.][a-z0-9-][.][a-z]')
CONSTRAINT Only_Given_Chars  CHECK (sample LIKE '[fvs]')
CONSTRAINT Only_18_years CHECK(DATEDIFF(yy,sample,GETDATE()) >= 18 )
CONSTRAINT Only_Quarter_Year CHECK(DATEADD(mm,3,EVDATUM) >= GETDATE() OR DATEADD(mm,6,EVDATUM) >= GETDATE() OR DATEADD(mm,12,EVDATUM) >= GETDATE())


USE Sample_Database
GO
SELECT ENEV, FCIM, EFIZDB, EIRSZ + ' ' + EUTCA AS Cím
FROM FTORZS INNER JOIN ETORZS INNER JOIN ELOFIZ
ON ETORZS.EKOD = ELOFIZ.EKOD 
ON FTORZS.FAZON = FTORZS.FAZON
WHERE EVDATUM >= GETDATE() AND EKDATUM <= GETDATE()
GO


USE Sample_Database
GO
SELECT DISTICT ETORZS.ENEV AS 'Elofizeto neve', FTORZS.FCIM AS 'Folyoirat cime', ELOFIZ.EFIZDB AS 'Rendelt db'
FROM ETORZS INNER JOIN FTORZS INNER JOIN ELOFIZ
ON EKOD = ELOFIZ.EKOD 
ON FTORZS.FAZON = ELOFIZ.FAZON
GO 


USE Sample_Database
GO
SELECT ETELEP, COUNT(*)
FROM ETORZS
GROUP BY ETELEP
GO


USE Sample_Database
GO
SELECT COUNT(*)
FROM ETORZS
GO


USE Sample_Database
GO
SELECT FCIM_RD
FROM FTORZS
WHERE FAZON_RD NOT IN (SELECT fazon_rd FROM ELOFIZ)
GO


USE Sample_Database
GO
SELECT TOP 1 FCIM_RD, FTORZS.FAZON_RD, FHDIJ_RD, SUM(EFIZDB_RD)
FROM FTORZS full JOIN ELOFIZ on FTORZS.FAZON_RD=ELOFIZ.FAZON_RD
GROUP BY FTORZS.FAZON_RD, FCIM_RD, FHDIJ_RD
ORDER BY 4 DESC
GO

*/