USE master
GO

/*------------------------------------------------------------------------------------------------------------------------------------*/

GRANT ADMINISTER BULK OPERATIONS TO [G14\G14]
ALTER SERVER ROLE [bulkadmin] ADD MEMBER [G14\G14]
ALTER SERVER ROLE [sysadmin] ADD MEMBER [G14\G14]
PRINT 'Successfully given admin rights to use bulk insert...'
GO

/*------------------------------------------------------------------------------------------------------------------------------------*/

IF  EXISTS (
	SELECT name 
		FROM sys.databases 
		WHERE name = N'Formula_1'
		
)
ALTER DATABASE Formula_1 SET single_user WITH ROLLBACK immediate
DROP DATABASE Formula_1
GO
CREATE DATABASE Formula_1
PRINT 'Successfully created database...'
GO
USE Formula_1
GO

/*------------------------------------------------------------------------------------------------------------------------------------*/

-- Create Table versenyzok
CREATE TABLE dbo.versenyzok
(
	 versenyzo_id char(4) NOT NULL,
	 keresztnev nvarchar(50) NOT NULL CONSTRAINT Only_Alphabets_KNEV CHECK (keresztnev NOT LIKE '%[^A-Z ]%'),
	 vezeteknev nvarchar(50) NOT NULL CONSTRAINT Only_Alphabets_VNEV CHECK (vezeteknev NOT LIKE '%[^A-Z ]%'),
	 orszag nvarchar(56) NOT NULL CONSTRAINT Only_Alphabets_ORSZ CHECK (orszag NOT LIKE '%[^A-Z ]%'),
	 beszelt_nyelv nvarchar(50) NOT NULL CONSTRAINT Only_Alphabets_BNYELV CHECK (beszelt_nyelv NOT LIKE '%[^A-Z ]%'),
	 konstruktor_id char(3) NOT NULL,
	 szuletesi_datum nvarchar(50) NOT NULL,
	 kod char(3) CONSTRAINT Only_Alphabets_KOD CHECK (kod NOT LIKE '%[^A-Z]%'),
	 --Add Primary Key
	 CONSTRAINT PK_versenyzok PRIMARY KEY (versenyzo_id ASC)	 
 )
PRINT 'Successfully created table versenyzok...'
GO

-- Create Table konstruktorok
CREATE TABLE dbo.konstruktorok
(
	 konstruktor_id char(3) NOT NULL,
	 nev nvarchar(50) NOT NULL CONSTRAINT Only_Alphabets_NEV CHECK (nev NOT LIKE '%[^A-Z ]%'),
	 csapatvezeto nvarchar(70) NOT NULL CONSTRAINT Only_Alphabets_CSNEV CHECK (csapatvezeto NOT LIKE '%[^A-Z ]%'),
	 orszag nvarchar(56) NOT NULL CONSTRAINT Only_Alphabets_KORSZ CHECK (orszag NOT LIKE '%[^A-Z ]%'),
	 --Add Primary Key
	 CONSTRAINT PK_konstruktorok PRIMARY KEY (konstruktor_id ASC)
 )
PRINT 'Successfully created table konstruktorok...'
GO

-- Create Table helyszinek
CREATE TABLE dbo.helyszinek(
	helyszin_id char(3) NOT NULL,
	palyanev nvarchar(50) NOT NULL CONSTRAINT Only_Alphabets_PNEV CHECK (palyanev NOT LIKE '%[^A-Z ]%'),
	telepules nvarchar(50) NOT NULL,
	orszag nvarchar(56) NOT NULL CONSTRAINT Only_Alphabets_HORSZ CHECK (orszag NOT LIKE '%[^A-Z ]%'),
	--Add Primary Key
	CONSTRAINT PK_helyszinek PRIMARY KEY (helyszin_id ASC)
 )
PRINT 'Successfully created table helyszinek...'
GO

-- Create Table idojarasi_korulmenyek
CREATE TABLE dbo.idojarasi_korulmenyek(
	idojarasi_korulmeny_id char(3) NOT NULL,
	nev nvarchar(50) NOT NULL CONSTRAINT Params CHECK(nev IN ('szaraz','esos','viharos','kodos','napos','paras')),
	--Add Primary Key
	CONSTRAINT PK_idojarasi_korulmenyek PRIMARY KEY (idojarasi_korulmeny_id ASC)
 )
PRINT 'Successfully created table idojarasi_korulmenyek...'
GO

-- Create Table autok
CREATE TABLE dbo.autok(
	auto_id char(5) NOT NULL,
	nev nvarchar(50) NOT NULL,
	karosszeria_tervezo_id char(3) NOT NULL,
	motor_tervezo_id char(3) NOT NULL,
	teljesitmeny char(4) NOT NULL CONSTRAINT Params_Telj CHECK (teljesitmeny >= 100 AND teljesitmeny <= 800),
	tömeg char(4) NOT NULL CONSTRAINT Params_Tom CHECK (tömeg >= 300 AND tömeg <= 1200),
	--Add Primary Key
	CONSTRAINT PK_autok PRIMARY KEY (auto_id ASC)
 )
PRINT 'Successfully created table autok...'
GO

-- Create Table szezonok
CREATE TABLE dbo.szezonok(
	szezon_id char(3) NOT NULL,
	ev nvarchar(50) NOT NULL,
	--Add Primary Key
	CONSTRAINT PK_szezonok PRIMARY KEY (szezon_id ASC)
 )
PRINT 'Successfully created table szezonok...'
GO

-- Create Table futamok
CREATE TABLE dbo.futamok(
	futam_id char(4) NOT NULL,
	szezon_id char(3) NOT NULL,
	helyszin_id char(3) NOT NULL,
	datum nvarchar(50),
	ido nvarchar(50),
	idojarasi_korulmeny_id char(3) NOT NULL,
	--Add Primary Key
	CONSTRAINT PK_futamok PRIMARY KEY (futam_id ASC))
	--Add Foreign Keys
	ALTER TABLE futamok ADD CONSTRAINT FK_futamok FOREIGN KEY (szezon_id) REFERENCES szezonok(szezon_id);
	ALTER TABLE futamok ADD CONSTRAINT FK2_futamok FOREIGN KEY (helyszin_id) REFERENCES helyszinek(helyszin_id);
	ALTER TABLE futamok ADD CONSTRAINT FK3_futamok FOREIGN KEY (idojarasi_korulmeny_id) REFERENCES idojarasi_korulmenyek(idojarasi_korulmeny_id);
PRINT 'Successfully created table futamok...'
GO

-- Create Table helyezesek
CREATE TABLE dbo.helyezesek(
	helyezes_id char(5) NOT NULL,
	versenyzo_id char(4) NOT NULL,
	elert_helyezes char(3) CONSTRAINT Params_Helyez CHECK (elert_helyezes >= 1 AND elert_helyezes <= 25),
	pole_poz bit NOT NULL,
	verseny_ido nvarchar(50),
	szezon_id char(3) NOT NULL,
	futam_id char(4) NOT NULL,
	auto_id char(5) NOT NULL,
	konstruktor_id char(3) NOT NULL,
	korok_szama char(3) NOT NULL,
	--Add Primary Key
	CONSTRAINT PK_helyezesek PRIMARY KEY (helyezes_id ASC))
	--Add Foreign Keys
	ALTER TABLE helyezesek ADD CONSTRAINT FK_helyezesek FOREIGN KEY (szezon_id) REFERENCES szezonok(szezon_id);
	ALTER TABLE helyezesek ADD CONSTRAINT FK2_helyezesek FOREIGN KEY (futam_id) REFERENCES futamok(futam_id);
	ALTER TABLE helyezesek ADD CONSTRAINT FK3_helyezesek FOREIGN KEY (auto_id) REFERENCES autok(auto_id);
	ALTER TABLE helyezesek ADD CONSTRAINT FK4_helyezesek FOREIGN KEY (konstruktor_id) REFERENCES konstruktorok(konstruktor_id);
	ALTER TABLE helyezesek ADD CONSTRAINT FK5_helyezesek FOREIGN KEY (versenyzo_id) REFERENCES versenyzok(versenyzo_id);
PRINT 'Successfully created table helyezesek...'
GO

/*------------------------------------------------------------------------------------------------------------------------------------*/

-- Fill Table versenyzok
BULK INSERT dbo.versenyzok
FROM 'D:\Google Drive\University\AB Kezelés\F1 CSV\f1_dataset_versenyzok.csv'
WITH
(
    FORMAT='CSV',
    FIRSTROW=2
)
PRINT 'Successfully filled table versenyzok...'



-- Fill Table konstruktorok
BULK INSERT dbo.konstruktorok
FROM 'D:\Google Drive\University\AB Kezelés\F1 CSV\f1_dataset_konstruktorok.csv'
WITH
(
    FORMAT='CSV',
    FIRSTROW=2
)
PRINT 'Successfully filled table konstruktorok...'

-- Fill Table helyszinek
BULK INSERT dbo.helyszinek
FROM 'D:\Google Drive\University\AB Kezelés\F1 CSV\f1_dataset_helyszinek.csv'
WITH
(
        FORMAT='CSV',
        FIRSTROW=2
)
PRINT 'Successfully filled table helyszinek...'


-- Fill Table idojarasi_korulmenyek
BULK INSERT dbo.idojarasi_korulmenyek
FROM 'D:\Google Drive\University\AB Kezelés\F1 CSV\f1_dataset_idojarasi_korulmenyek.csv'
WITH
(
        FORMAT='CSV',
        FIRSTROW=2
)
PRINT 'Successfully filled table idojarasi_korulmenyek...'

-- Fill Table autok
BULK INSERT dbo.autok
FROM 'D:\Google Drive\University\AB Kezelés\F1 CSV\f1_dataset_autok.csv'
WITH
(
        FORMAT='CSV',
        FIRSTROW=2
)
PRINT 'Successfully filled table autok...'


-- Fill Table szezonok
BULK INSERT dbo.szezonok
FROM 'D:\Google Drive\University\AB Kezelés\F1 CSV\f1_dataset_szezonok.csv'
WITH
(
        FORMAT='CSV',
        FIRSTROW=2
)
PRINT 'Successfully filled table szezonok...'


-- Fill Table futamok
BULK INSERT dbo.futamok
FROM 'D:\Google Drive\University\AB Kezelés\F1 CSV\f1_dataset_futamok.csv'
WITH
(
        FORMAT='CSV',
        FIRSTROW=2
)

PRINT 'Successfully filled table futamok...'


-- Fill Table helyezesek
BULK INSERT dbo.helyezesek
FROM 'D:\Google Drive\University\AB Kezelés\F1 CSV\f1_dataset_helyezesek.csv'
WITH
(
        FORMAT='CSV',
        FIRSTROW=2
)
PRINT 'Successfully filled table helyezesek...'

GO

/*DATA CONVERSION FROM VARCHAR TO DATE AND TIME!*/

ALTER TABLE versenyzok
ALTER COLUMN szuletesi_datum date
PRINT 'Successfully converted versenyzok.szuletesi_datum...'

GO

ALTER TABLE futamok
ALTER COLUMN ido time(7)
PRINT 'Successfully converted futamok.ido...'

GO

ALTER TABLE futamok
ALTER COLUMN datum date
PRINT 'Successfully converted futamok.datum...'
GO

ALTER TABLE szezonok
ALTER COLUMN ev date
PRINT 'Successfully converted szezonok.ev...'
GO

ALTER TABLE helyezesek
ALTER COLUMN verseny_ido time(7)
PRINT 'Successfully converted helyezesek.verseny_ido...'
GO

PRINT 'Successfully done all tasks...'
PRINT 'Exiting...'

GO
/*------------------------------------------------------------------------------------------------------------------------------------*/
