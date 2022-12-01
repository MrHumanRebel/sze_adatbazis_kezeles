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
    FAZON char(4) NOT NULL,
    FTIPUS nvarchar(20) NOT NULL CONSTRAINT Params_Ftipus CHECK (FTIPUS in ('napi','családi','szakmai tudományos','egyéb')),
    FCIM nvarchar(50) NOT NULL,
    FKIAD nvarchar(50) NOT NULL,
    FHDIJ char(6) NOT NULL CONSTRAINT Params_Fhdij CHECK(FHDIJ >= 100 AND FHDIJ < 100000),
    CONSTRAINT PK_FTORZS PRIMARY KEY (FAZON ASC)
)
GO
CREATE TABLE dbo.ETORZS(
    EKOD char(4) NOT NULL,
    ENEV nvarchar(50) NOT NULL,
    ESZDAT date NOT NULL CONSTRAINT Params_Eszdat CHECK(DATEDIFF(yy,ESZDAT,GETDATE()) >= 18 ),
    EIRSZ char(4) NOT NULL CONSTRAINT Params_Eirsz CHECK(EIRSZ >= 1011 AND EIRSZ <= 9909),
    ETELEP nvarchar(50) NOT NULL,
    EUTCA nvarchar(50) NOT NULL,
    CONSTRAINT PK_ETORZS PRIMARY KEY (EKOD ASC)
)
GO
CREATE TABLE dbo.ELOFIZ(
    EKOD char(4) NOT NULL,
    EKDATUM date NOT NULL DEFAULT GETDATE(),
    EVDATUM date NOT NULL,
    FAZON char(4) NOT NULL,
    EFIZDB char(4) NOT NULL CONSTRAINT Params_Efizdb CHECK(EFIZDB < 1000 AND EFIZDB > 0))
    ALTER TABLE ELOFIZ ADD CONSTRAINT FK_EKOD FOREIGN KEY (EKOD) REFERENCES ETORZS(EKOD);
    ALTER TABLE ELOFIZ ADD CONSTRAINT FK_FAZON FOREIGN KEY (FAZON) REFERENCES FTORZS(FAZON);
GO
/*------------------------------------------------------------------------*/
INSERT INTO FTORZS (FAZON, FTIPUS, FCIM, FKIAD, FHDIJ)
VALUES ('1', 'napi', 'Egy macska élete', 'MacskaAdó Kft. & Kis Pista', '50000');
GO
INSERT INTO FTORZS (FAZON, FTIPUS, FCIM, FKIAD, FHDIJ)
VALUES ('2', 'családi', 'Egy macska élete a családban', 'MacskaSzedő Kft. & Nagy Béla', '60000');
GO
INSERT INTO FTORZS (FAZON, FTIPUS, FCIM, FKIAD, FHDIJ)
VALUES ('3', 'szakmai tudományos', 'Egy macska élete a tudományban', 'MacskaKenő Kft. & Közepes János', '70000');
GO
/*------------------------------------------------------------------------*/
INSERT INTO ETORZS(EKOD, ENEV, ESZDAT, EIRSZ, ETELEP, EUTCA)
VALUES ('10', 'Bakfi Lajos', '2000-01-01', '9172', 'Kiskunhalas', 'Nagy Jenő utca 672');
GO
INSERT INTO ETORZS(EKOD, ENEV, ESZDAT, EIRSZ, ETELEP, EUTCA)
VALUES ('20', 'Szekunder Pali', '1999-02-01', '9173', 'Nagykunhalas', 'Kis Anna utca 6942');
GO
INSERT INTO ETORZS(EKOD, ENEV, ESZDAT, EIRSZ, ETELEP, EUTCA)
VALUES ('30', 'Nagyatádi István', '1959-09-01', '9170', 'Középkunhalas', 'Óriás Péter utca 1');
GO
/*------------------------------------------------------------------------*/
INSERT INTO ELOFIZ (EKOD, EVDATUM, FAZON, EFIZDB)
VALUES ('10', '2022-12-01', '1', '10')
GO
INSERT INTO ELOFIZ (EKOD, EVDATUM, FAZON, EFIZDB)
VALUES ('20', '2024-12-01', '2', '20')
GO
INSERT INTO ELOFIZ (EKOD, EVDATUM, FAZON, EFIZDB)
VALUES ('30', '2032-12-01', '3', '600')
GO
