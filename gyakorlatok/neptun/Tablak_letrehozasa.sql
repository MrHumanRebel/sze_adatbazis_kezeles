USE HallgatoiNyilvanT
GO

-- CREATE TABLE hallgatok
CREATE TABLE HallgatoiNyilvanT.dbo.hallgatok
(
	neptun nchar(6) NOT NULL,
	vnev nvarchar(50) NOT NULL,
	knev nvarchar(50) NOT NULL,
	telepules nvarchar(50) NOT NULL,
	utca nvarchar(50) NOT NULL,
	irsz nvarchar(10) NULL,
	tel nvarchar(50) NULL,
	szdat date NOT NULL,
	lany bit NULL,
	kforma nchar(10) NULL,
	tszam tinyint NULL,
	kdij money NULL,
	egyeb nvarchar(max) NULL,
	CONSTRAINT PK_hallgatok PRIMARY KEY (neptun ASC)
	)
GO

-- CREATE TABLE tantargyak
CREATE TABLE HallgatoiNyilvanT.dbo.tantargyak
(
	tkod nvarchar(50) NOT NULL,
	tnev nvarchar(80) NOT NULL,
	kredit tinyint NOT NULL,
	tkov nvarchar(40) NULL,
	CONSTRAINT PK_tantargyak PRIMARY KEY (tkod ASC)
	)
GO

-- CREATE TABLE jegyek
CREATE TABLE HallgatoiNyilvanT.dbo.jegyek(
	neptun nchar(6) NOT NULL,
	tkod nvarchar(50) NOT NULL,
	jegy tinyint NOT NULL,
	vdatum date NOT NULL,
	uv tinyint NULL,
	tanev nchar(10) NULL,
	felev nchar(10) NULL
	)
GO