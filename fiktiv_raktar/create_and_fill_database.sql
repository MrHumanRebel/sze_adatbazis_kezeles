USE master
GO
/*------------------------------------------------------------------------*/
ALTER SERVER ROLE [sysadmin] ADD MEMBER [G14\Daniel]
/*------------------------------------------------------------------------*/
GO
IF EXISTS (
	SELECT name
		FROM sys.databases
		WHERE name = N'FiktivRakt'
)
ALTER DATABASE FiktivRakt SET single_user WITH ROLLBACK immediate
DROP DATABASE FiktivRakt
CREATE DATABASE FiktivRakt
GO
USE FiktivRakt
GO
/*------------------------------------------------------------------------*/
CREATE TABLE dbo.UGYFELEK(
    UGYFEL_ID int IDENTITY(1,1) NOT NULL,
    NEV nvarchar(100) NOT NULL,
    TELEFONSZAM char(12) NOT NULL,
    IRSZAM char(4) NOT NULL,
    TELEPULES nvarchar(50) NOT NULL,
    UTCA nvarchar(50) NOT NULL,
    HAZSZAM varchar(10) NOT NULL,
    CONSTRAINT PK_Ugyfelek PRIMARY KEY (UGYFEL_ID ASC)
)
GO
CREATE TABLE dbo.TERMEKEK(
    TERMEK_ID int IDENTITY(1,1) NOT NULL,
    NEV nvarchar(100) NOT NULL,
    GYARTO_ID char(3) NOT NULL,
    KESZLET bit,
    KORNYEZETBARAT bit,
    KATEGORIA_ID int NOT NULL,
    CONSTRAINT PK_Termekek PRIMARY KEY (TERMEK_ID ASC)
)
GO
CREATE TABLE dbo.UGYINTEZO(
    UGYINTEZO_ID int IDENTITY(1,1) NOT NULL,
    NEV nvarchar(50) NOT NULL,
    CIM nvarchar(50) NOT NULL,
    TELEFONSZAM char(12) NOT NULL,
    CONSTRAINT PK_Ugyintezo PRIMARY KEY (UGYINTEZO_ID ASC)
)
GO
CREATE TABLE dbo.MEGRENDELESEK(
    MEGRENDELES_ID int NOT NULL,
    MEGRENDELES_DATUMA datetime NOT NULL,
    TERMEK_ID int NOT NULL,
    MENNYISEG int,
    FIZETVE bit,
    UGYFEL_ID int NOT NULL,
    UGYINTEZO_ID int NOT NULL,
    CONSTRAINT PK_Megrend PRIMARY KEY (MEGRENDELES_ID ASC))
    ALTER TABLE MEGRENDELESEK ADD CONSTRAINT FK_Termek FOREIGN KEY (TERMEK_ID) REFERENCES TERMEKEK(TERMEK_ID);
    ALTER TABLE MEGRENDELESEK ADD CONSTRAINT FK_Ugyfel FOREIGN KEY (UGYFEL_ID) REFERENCES UGYFELEK(UGYFEL_ID);
    ALTER TABLE MEGRENDELESEK ADD CONSTRAINT FK_Ugyintezo FOREIGN KEY (UGYINTEZO_ID) REFERENCES UGYINTEZO(UGYINTEZO_ID);
GO
CREATE TABLE dbo.KATEGORIAK(
    KATEGORIA_ID int NOT NULL,
    KATEGORIA_NEV nvarchar(100) NOT NULL,
    CONSTRAINT PK_Kateg PRIMARY KEY (KATEGORIA_ID ASC)
	)
GO
CREATE TABLE dbo.GYARTOK(
    GYARTO_ID int NOT NULL,
    GYARTO_NEV nvarchar(100) NOT NULL,
    GYARTO_ORSZAG nvarchar(100) NOT NULL,
    CONSTRAINT PK_Gyarto PRIMARY KEY (GYARTO_ID ASC)
	)
GO
USE FiktivRakt
GO
/*------------------------------------------------------------------------*/
INSERT INTO UGYFELEK (NEV ,TELEFONSZAM, IRSZAM, TELEPULES, UTCA, HAZSZAM)
VALUES ('Kis Lajos', '+36201233210', '9500', 'NagyPest', 'Macska utca', '600');
GO
INSERT INTO UGYFELEK (NEV ,TELEFONSZAM, IRSZAM, TELEPULES, UTCA, HAZSZAM)
VALUES ('Nagy Alajos', '+36301233210', '9600', 'KisPest', 'Kutya utca', '800');
GO
INSERT INTO UGYFELEK (NEV ,TELEFONSZAM, IRSZAM, TELEPULES, UTCA, HAZSZAM)
VALUES ('Közepes Blajos', '+36801233210', '9700', 'KözepesPest', 'Nincs utca', '900');
GO
/*------------------------------------------------------------------------*/
INSERT INTO TERMEKEK (NEV, GYARTO_ID, KESZLET, KORNYEZETBARAT, KATEGORIA_ID)
VALUES ('iPhone 8542GMCSPROMAXUBERKIRLAYPRO', '543', '1', '1', '1');
GO
INSERT INTO TERMEKEK (NEV, GYARTO_ID, KESZLET, KORNYEZETBARAT, KATEGORIA_ID)
VALUES ('iPad PROMAXMINIPROKISNAGY23456', '541', '1', '1', '2');
GO
INSERT INTO TERMEKEK (NEV, GYARTO_ID, KESZLET, KORNYEZETBARAT, KATEGORIA_ID)
VALUES ('iMac PROMAXMINIM2ULTRAMINIPRO', '540', '1', '1', '3');
GO
/*------------------------------------------------------------------------*/
INSERT INTO UGYINTEZO (NEV, CIM, TELEFONSZAM)
VALUES ('Picike Adél', 'Debrecen, Görény utca 1', '+36991233210');
GO
INSERT INTO UGYINTEZO (NEV, CIM, TELEFONSZAM)
VALUES ('Óriás Ilona', 'Bugyi, Lábszár utca 2', '+36881233210');
GO
INSERT INTO UGYINTEZO (NEV, CIM, TELEFONSZAM)
VALUES ('Közepes Marona', 'Szexárd, Kisegér körút 60', '+36771233210');
GO
/*------------------------------------------------------------------------*/
INSERT INTO MEGRENDELESEK (MEGRENDELES_ID, MEGRENDELES_DATUMA, TERMEK_ID, MENNYISEG, FIZETVE, UGYFEL_ID, UGYINTEZO_ID)
VALUES ('1','2022-01-01','1','600','1','1','1');
GO
INSERT INTO MEGRENDELESEK (MEGRENDELES_ID, MEGRENDELES_DATUMA, TERMEK_ID, MENNYISEG, FIZETVE, UGYFEL_ID, UGYINTEZO_ID)
VALUES ('2','2021-01-01','2','500','1','2','2');
GO
INSERT INTO MEGRENDELESEK (MEGRENDELES_ID, MEGRENDELES_DATUMA, TERMEK_ID, MENNYISEG, FIZETVE, UGYFEL_ID, UGYINTEZO_ID)
VALUES ('3','2020-01-01','3','400','1','3','3');
GO
/*------------------------------------------------------------------------*/
INSERT INTO KATEGORIAK (KATEGORIA_ID, KATEGORIA_NEV)
VALUES ('1','Telefonok');
GO
INSERT INTO KATEGORIAK (KATEGORIA_ID, KATEGORIA_NEV)
VALUES ('2','Tabletek');
GO
INSERT INTO KATEGORIAK (KATEGORIA_ID, KATEGORIA_NEV)
VALUES ('3','Gépek');
GO
/*------------------------------------------------------------------------*/
INSERT INTO GYARTOK (GYARTO_ID, GYARTO_NEV, GYARTO_ORSZAG)
VALUES ('1','Alma','Amerika');
GO
INSERT INTO GYARTOK (GYARTO_ID, GYARTO_NEV, GYARTO_ORSZAG)
VALUES ('2','Apple','USA');
GO
INSERT INTO GYARTOK (GYARTO_ID, GYARTO_NEV, GYARTO_ORSZAG)
VALUES ('3','Apple Inc.','United States of America');
GO
/*------------------------------------------------------------------------*/
