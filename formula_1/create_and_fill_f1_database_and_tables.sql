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
	 keresztnev nvarchar(50) NOT NULL,
	 vezeteknev nvarchar(50) NOT NULL,
	 orszag nvarchar(56) NOT NULL,
	 beszelt_nyelv nvarchar(50) NOT NULL,
	 konstruktor_id char(3) NOT NULL,
	 szuletesi_datum date NOT NULL,
	 kod char(3),
	 --Add Primary Key
	 CONSTRAINT PK_versenyzok PRIMARY KEY (versenyzo_id ASC)	 
 )
PRINT 'Successfully created table versenyzok...'
GO

-- Create Table konstruktorok
CREATE TABLE dbo.konstruktorok
(
	 konstruktor_id char(3) NOT NULL,
	 nev nvarchar(50) NOT NULL,
	 csapatvezeto nvarchar(70) NOT NULL,
	 orszag nvarchar(56) NOT NULL,
	 --Add Primary Key
	 CONSTRAINT PK_konstruktorok PRIMARY KEY (konstruktor_id ASC)
 )
PRINT 'Successfully created table konstruktorok...'
GO

-- Create Table helyszin
CREATE TABLE dbo.helyszin(
	helyszin_id char(3) NOT NULL,
	palyanev nvarchar(50) NOT NULL,
	telepules nvarchar(50) NOT NULL,
	orszag nvarchar(56) NOT NULL,
	--Add Primary Key
	CONSTRAINT PK_helyszin PRIMARY KEY (helyszin_id ASC)
 )
PRINT 'Successfully created table helyszin...'
GO

-- Create Table idojarasi_korulmenyek
CREATE TABLE dbo.idojarasi_korulmenyek(
	idojarasi_korulmeny_id char(3) NOT NULL,
	nev nvarchar(50) NOT NULL,
	--Add Primary Key
	CONSTRAINT PK_idojarasi_korulmenyek PRIMARY KEY (idojarasi_korulmeny_id ASC)
 )
PRINT 'Successfully created table idojarasi_korulmenyek...'
GO

-- Create Table autok
CREATE TABLE dbo.autok(
	auto_id char(3) NOT NULL,
	nev nvarchar(50) NOT NULL,
	karosszeria_tervezo_id char(3) NOT NULL,
	motor_tervezo_id char(3) NOT NULL,
	teljesitmeny char(4) NOT NULL,
	tömeg char(4) NOT NULL,
	--Add Primary Key
	CONSTRAINT PK_autok PRIMARY KEY (auto_id ASC)
 )
PRINT 'Successfully created table autok...'
GO

-- Create Table szezon
CREATE TABLE dbo.szezon(
	szezon_id char(3) NOT NULL,
	ev date NOT NULL,
	--Add Primary Key
	CONSTRAINT PK_szezon PRIMARY KEY (szezon_id ASC)
 )
PRINT 'Successfully created table szezon...'
GO

-- Create Table futamok
CREATE TABLE dbo.futamok(
	futam_id char(4) NOT NULL,
	szezon_id char(3) NOT NULL,
	helyszin_id char(3) NOT NULL,
	datum date NOT NULL,
	ido time(7),
	idojarasi_korulmeny_id char(3) NOT NULL,
	--Add Primary Key
	CONSTRAINT PK_futamok PRIMARY KEY (futam_id ASC))
	--Add Foreign Keys
	ALTER TABLE futamok ADD CONSTRAINT FK_futamok FOREIGN KEY (szezon_id) REFERENCES szezon(szezon_id);
	ALTER TABLE futamok ADD CONSTRAINT FK2_futamok FOREIGN KEY (helyszin_id) REFERENCES helyszin(helyszin_id);
PRINT 'Successfully created table futamok...'
GO

-- Create Table helyezesek
CREATE TABLE dbo.helyezesek(
	helyezes_id char(5) NOT NULL,
	versenyzo_id char(4) NOT NULL,
	elert_helyezes char(3),
	pole_poz bit NOT NULL,
	verseny_ido time(7),
	szezon_id char(3) NOT NULL,
	futam_id char(4) NOT NULL,
	auto_id char(3) NOT NULL,
	konstruktor_id char(3) NOT NULL,
	korok_szama char(3) NOT NULL,
	--Add Primary Key
	CONSTRAINT PK_helyezesek PRIMARY KEY (helyezes_id ASC))
	--Add Foreign Keys
	ALTER TABLE helyezesek ADD CONSTRAINT FK_helyezesek FOREIGN KEY (szezon_id) REFERENCES szezon(szezon_id);
	ALTER TABLE helyezesek ADD CONSTRAINT FK2_helyezesek FOREIGN KEY (futam_id) REFERENCES futamok(futam_id);
	ALTER TABLE helyezesek ADD CONSTRAINT FK3_helyezesek FOREIGN KEY (auto_id) REFERENCES autok(auto_id);
	ALTER TABLE helyezesek ADD CONSTRAINT FK4_helyezesek FOREIGN KEY (konstruktor_id) REFERENCES konstruktorok(konstruktor_id);
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

-- Fill Table helyszin
BULK INSERT dbo.helyszin
FROM 'D:\Google Drive\University\AB Kezelés\F1 CSV\f1_dataset_helyszinek.csv'
WITH
(
        FORMAT='CSV',
        FIRSTROW=2
)
PRINT 'Successfully filled table helyszin...'


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


-- Fill Table szezon
BULK INSERT dbo.szezon
FROM 'D:\Google Drive\University\AB Kezelés\F1 CSV\f1_dataset_szezonok.csv'
WITH
(
        FORMAT='CSV',
        FIRSTROW=2
)
PRINT 'Successfully filled table szezon...'


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
PRINT 'Successfully done all tasks...'
PRINT 'Exiting...'
GO
/*------------------------------------------------------------------------------------------------------------------------------------*/
