USE Formula_1
GO

-- Create Table versenyzok
CREATE TABLE Formula_1.dbo.versenyzok
(
	 versenyzo_id char(3) NOT NULL,
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
	ido time(7) NOT NULL,
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
	versenyzo_id char(3) NOT NULL,
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

-- Fill Table versenyzok
BULK INSERT Formula_1.dbo.versenyzok
FROM 'f1_versenyzok.csv'
WITH
(
    FIRSTROW = 2, -- As 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)
GO

-- Fill Table konstruktorok
BULK INSERT Formula_1.dbo.konstruktorok
FROM 'f1_konstruktorok.csv'
WITH
(
    FIRSTROW = 2, -- As 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)
GO

-- Fill Table helyszin
BULK INSERT Formula_1.dbo.helyszin
FROM 'f1_helyszin.csv'
WITH
(
    FIRSTROW = 2, -- As 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)
GO

-- Fill Table idojarasi_korulmenyek
BULK INSERT Formula_1.dbo.idojarasi_korulmenyek
FROM 'f1_idojarasi_korulmenyek.csv'
WITH
(
    FIRSTROW = 2, -- As 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)
GO

-- Fill Table autok
BULK INSERT Formula_1.dbo.autok
FROM 'f1_autok.csv'
WITH
(
    FIRSTROW = 2, -- As 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)
GO

-- Fill Table szezon
BULK INSERT Formula_1.dbo.szezon
FROM 'f1_szezon.csv'
WITH
(
    FIRSTROW = 2, -- As 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)
GO

-- Fill Table futamok
BULK INSERT Formula_1.dbo.futamok
FROM 'f1_futamok.csv'
WITH
(
    FIRSTROW = 2, -- As 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)
GO

-- Fill Table helyezesek
BULK INSERT Formula_1.dbo.helyezesek
FROM 'f1_helyezesek.csv'
WITH
(
    FIRSTROW = 2, -- As 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)
GO