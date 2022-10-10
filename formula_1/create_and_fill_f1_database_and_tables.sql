USE master
GO

IF  EXISTS (
	SELECT name 
		FROM sys.databases 
		WHERE name = N'Formula_1'
)
DROP DATABASE Formula_1
GO

CREATE DATABASE Formula_1
GO

USE Formula_1
GO

-- Create Table versenyzok
CREATE TABLE Formula_1.dbo.versenyzok
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
GO

-- Create Table konstruktorok
CREATE TABLE Formula_1.dbo.konstruktorok
(
	 konstruktor_id char(3) NOT NULL,
	 nev nvarchar(50) NOT NULL,
	 csapatvezeto nvarchar(70) NOT NULL,
	 orszag nvarchar(56) NOT NULL,
	 --Add Primary Key
	 CONSTRAINT PK_konstruktorok PRIMARY KEY (konstruktor_id ASC)
 )
GO

-- Create Table helyszin
CREATE TABLE Formula_1.dbo.helyszin(
	helyszin_id char(3) NOT NULL,
	palyanev nvarchar(50) NOT NULL,
	telepules nvarchar(50) NOT NULL,
	orszag nvarchar(56) NOT NULL,
	--Add Primary Key
	CONSTRAINT PK_helyszin PRIMARY KEY (helyszin_id ASC)
 )
GO

-- Create Table idojarasi_korulmenyek
CREATE TABLE Formula_1.dbo.idojarasi_korulmenyek(
	idojarasi_korulmeny_id char(3) NOT NULL,
	nev nvarchar(50) NOT NULL,
	--Add Primary Key
	CONSTRAINT PK_idojarasi_korulmenyek PRIMARY KEY (idojarasi_korulmeny_id ASC)
 )
GO

-- Create Table autok
CREATE TABLE Formula_1.dbo.autok(
	auto_id char(3) NOT NULL,
	nev nvarchar(50) NOT NULL,
	karosszeria_tervezo_id char(3) NOT NULL,
	motor_tervezo_id char(3) NOT NULL,
	teljesitmeny char(4) NOT NULL,
	tömeg char(4) NOT NULL,
	--Add Primary Key
	CONSTRAINT PK_autok PRIMARY KEY (auto_id ASC)
 )
GO

-- Create Table szezon
CREATE TABLE Formula_1.dbo.szezon(
	szezon_id char(3) NOT NULL,
	ev date NOT NULL,
	--Add Primary Key
	CONSTRAINT PK_szezon PRIMARY KEY (szezon_id ASC)
 )
GO

-- Create Table futamok
CREATE TABLE Formula_1.dbo.futamok(
	futam_id char(3) NOT NULL,
	szezon_id char(3) NOT NULL,
	helyszin_id char(3) NOT NULL,
	datum date NOT NULL,
	ido time(7),
	idojarasi_korulmeny_id char(3) NOT NULL,
	--Add Primary Key
	CONSTRAINT PK_futamok PRIMARY KEY (futam_id ASC)
	--Add Foreign Keys
	ALTER TABLE szezon ADD CONSTRAINT FK_futamok FOREIGN KEY (szezon_id) REFERENCES szezon(szezon_id);
	ALTER TABLE helyszin ADD CONSTRAINT FK2_futamok FOREIGN KEY (helyszin_id) REFERENCES helyszin(helyszin_id);
 )
GO

-- Create Table helyezesek
CREATE TABLE Formula_1.dbo.helyezesek(
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
	CONSTRAINT PK_helyezesek PRIMARY KEY (helyezes_id ASC)
	--Add Foreign Keys
	ALTER TABLE szezon ADD CONSTRAINT FK_helyezesek FOREIGN KEY (szezon_id) REFERENCES szezon(szezon_id);
	ALTER TABLE futamok ADD CONSTRAINT FK2_helyezesek FOREIGN KEY (futam_id) REFERENCES futamok(futam_id);
	ALTER TABLE autok ADD CONSTRAINT FK3_helyezesek FOREIGN KEY (auto_id) REFERENCES autok(auto_id);
	ALTER TABLE konstruktor ADD CONSTRAINT FK4_helyezesek FOREIGN KEY (konstruktor_id) REFERENCES konstruktorok(konstruktor_id);
 )
GO


-- Set CSV dataset location folder
DECLARE @FullDirectory VARCHAR(256);
SET @FullDirectory = 'D:\Google Drive\University\AB Kezelés\F1 CSV\f1_dataset.xlsx - versenyek.csv';
-- Fill Table versenyzok
BULK INSERT Formula_1.dbo.versenyzok
FROM FullDirectory
WITH
(
    FIRSTROW = 2, -- As 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)
GO

-- Set CSV dataset location folder
DECLARE @FullDirectory VARCHAR(256);
SET @FullDirectory = 'D:\Google Drive\University\AB Kezelés\F1 CSV\f1_dataset.xlsx - konstruktorok.csv';
-- Fill Table konstruktorok
BULK INSERT Formula_1.dbo.konstruktorok
FROM FullDirectory
WITH
(
    FIRSTROW = 2, -- As 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)
GO

-- Set CSV dataset location folder
DECLARE @FullDirectory VARCHAR(256);
SET @FullDirectory = 'D:\Google Drive\University\AB Kezelés\F1 CSV\f1_dataset.xlsx - helyszin.csv';
-- Fill Table helyszin
BULK INSERT Formula_1.dbo.helyszin
FROM FullDirectory
WITH
(
    FIRSTROW = 2, -- As 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)
GO

-- Set CSV dataset location folder
DECLARE @FullDirectory VARCHAR(256);
SET @FullDirectory = 'D:\Google Drive\University\AB Kezelés\F1 CSV\f1_dataset.xlsx - idojarasi_korulmenyek.csv';
-- Fill Table idojarasi_korulmenyek
BULK INSERT Formula_1.dbo.idojarasi_korulmenyek
FROM FullDirectory
WITH
(
    FIRSTROW = 2, -- As 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)
GO

-- Set CSV dataset location folder
DECLARE @FullDirectory VARCHAR(256);
SET @FullDirectory = 'D:\Google Drive\University\AB Kezelés\F1 CSV\f1_dataset.xlsx - autok.csv';
-- Fill Table autok
BULK INSERT Formula_1.dbo.autok
FROM FullDirectory
WITH
(
    FIRSTROW = 2, -- As 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)
GO

-- Set CSV dataset location folder
DECLARE @FullDirectory VARCHAR(256);
SET @FullDirectory = 'D:\Google Drive\University\AB Kezelés\F1 CSV\f1_dataset.xlsx - szezon.csv';
-- Fill Table szezon
BULK INSERT Formula_1.dbo.szezon
FROM FullDirectory
WITH
(
    FIRSTROW = 2, -- As 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)
GO

-- Set CSV dataset location folder
DECLARE @FullDirectory VARCHAR(256);
SET @FullDirectory = 'D:\Google Drive\University\AB Kezelés\F1 CSV\f1_dataset.xlsx - futamok.csv';
-- Fill Table futamok
BULK INSERT Formula_1.dbo.futamok
FROM FullDirectory
WITH
(
    FIRSTROW = 2, -- As 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)
GO

-- Set CSV dataset location folder
DECLARE @FullDirectory VARCHAR(256);
SET @FullDirectory = 'D:\Google Drive\University\AB Kezelés\F1 CSV\f1_dataset.xlsx - helyezesek.csv';
-- Fill Table helyezesek
BULK INSERT Formula_1.dbo.helyezesek
FROM FullDirectory
WITH
(
    FIRSTROW = 2, -- As 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)
GO
