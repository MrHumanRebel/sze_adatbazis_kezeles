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
	CONSTRAINT FK_futamok FOREIGN KEY (szezon_id ASC) REFERENCES szezon(szezon_id)
	CONSTRAINT FK2_futamok FOREIGN KEY (helyszin_id ASC) REFERENCES helyszin(helyszin_id)
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
	CONSTRAINT FK_helyezesek FOREIGN KEY (szezon_id ASC) REFERENCES szezon(szezon_id)
	CONSTRAINT FK2_helyezesek FOREIGN KEY (futam_id ASC) REFERENCES futamok(futam_id)
	CONSTRAINT FK3_helyezesek FOREIGN KEY (auto_id ASC) REFERENCES autok(auto_id)
	CONSTRAINT FK4_helyezesek FOREIGN KEY (konstruktor_id ASC) REFERENCES konstruktorok(konstruktor_id)
 )
GO


-- Set CSV dataset location folder
DECLARE @Directory VARCHAR(256);
DECLARE @FullDirectory VARCHAR(256);
SET @Directory = 'D:\Google Drive\University\AB Kezelés\F1 CSV\';
DECLARE @Versenyzo VARCHAR(256);
SET @Versenyzo = 'f1_dataset.xlsx - versenyzok.csv';
SET @FullDirectory = @Directory + @Versenyzo;
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

-- Fill Table konstruktorok
DECLARE @Directory VARCHAR(256);
DECLARE @FullDirectory VARCHAR(256);
SET @Directory = 'D:\Google Drive\University\AB Kezelés\F1 CSV\';
DECLARE @Konst VARCHAR(256);
SET @Konst = 'f1_dataset.xlsx - konstruktorok.csv';
SET @FullDirectory = @Directory + @Konst;
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

-- Fill Table helyszin
DECLARE @Directory VARCHAR(256);
DECLARE @FullDirectory VARCHAR(256);
SET @Directory = 'D:\Google Drive\University\AB Kezelés\F1 CSV\';
DECLARE @Hely VARCHAR(256);
SET @Hely = 'f1_dataset.xlsx - helyszin.csv';
SET @FullDirectory = @Directory + @Hely;
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

-- Fill Table idojarasi_korulmenyek
DECLARE @Directory VARCHAR(256);
DECLARE @FullDirectory VARCHAR(256);
SET @Directory = 'D:\Google Drive\University\AB Kezelés\F1 CSV\';
DECLARE @Idoj VARCHAR(256);
SET @Idoj = 'f1_dataset.xlsx - idojarasi_korulmenyek.csv';
SET @FullDirectory = @Directory + @Idoj;
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

-- Fill Table autok
DECLARE @Directory VARCHAR(256);
DECLARE @FullDirectory VARCHAR(256);
SET @Directory = 'D:\Google Drive\University\AB Kezelés\F1 CSV\';
DECLARE @Auto VARCHAR(256);
SET @Auto = 'f1_dataset.xlsx - autok.csv';
SET @FullDirectory = @Directory + @Auto;
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

-- Fill Table szezon
DECLARE @Directory VARCHAR(256);
DECLARE @FullDirectory VARCHAR(256);
SET @Directory = 'D:\Google Drive\University\AB Kezelés\F1 CSV\';
DECLARE @Szezon VARCHAR(256);
SET @Szezon = 'f1_dataset.xlsx - szezon.csv';
SET @FullDirectory = @Directory + @Szezon;
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

-- Fill Table futamok
DECLARE @Directory VARCHAR(256);
DECLARE @FullDirectory VARCHAR(256);
SET @Directory = 'D:\Google Drive\University\AB Kezelés\F1 CSV\';
DECLARE @Fut VARCHAR(256);
SET @Fut = 'f1_dataset.xlsx - futamok.csv';
SET @FullDirectory = @Directory + @Fut;
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

-- Fill Table helyezesek
DECLARE @Directory VARCHAR(256);
DECLARE @FullDirectory VARCHAR(256);
SET @Directory = 'D:\Google Drive\University\AB Kezelés\F1 CSV\';
DECLARE @Helyez VARCHAR(256);
SET @Helyez = 'f1_dataset.xlsx - helyezesek.csv';
SET @FullDirectory = @Directory + @Helyez;
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
