USE master 
GO

/*------------------------------------------------------------------------------------------------------------------------------------*/

IF  EXISTS (
	SELECT name 
		FROM sys.databases 
		WHERE name = N'Sample_Database'
		
)
ALTER DATABASE Sample_Database SET single_user WITH ROLLBACK immediate
DROP DATABASE Sample_Database
GO

CREATE DATABASE Sample_Database
PRINT 'Successfully created database...'
GO

USE Sample_Database
GO

-- Create Table
CREATE TABLE dbo.sample_table(
	id char(4) NOT NULL,
	nev nvarchar(50) NOT NULL CONSTRAINT Params CHECK(nev IN ('szaraz','esos','viharos','kodos','napos','paras')),
	orszag nvarchar(56) NOT NULL CONSTRAINT Only_Alphabets CHECK (orszag NOT LIKE '%[^A-Z ]%'),
    datum date,
	ido time(7),
    teljesitmeny char(4) NOT NULL CONSTRAINT Params_Telj CHECK (teljesitmeny >= 100 AND teljesitmeny <= 800),
        
	--Add Primary Key
	CONSTRAINT PK_name PRIMARY KEY (current_table_place ASC)) --Warning! Double brackets!!!
    --Add Foreign Keys
	ALTER TABLE sample_table ADD CONSTRAINT FK_name FOREIGN KEY (current_table_place) REFERENCES other_table(reference_table_place);
	ALTER TABLE sample_table ADD CONSTRAINT FK2_name FOREIGN KEY (current_table_place) REFERENCES other_table_2(reference_table_place);
PRINT 'Successfully created table sample_table...'
GO

/*
CONSTRAINT Only_Alphabets CHECK (sample NOT LIKE '%[^A-Z ]%')
CONSTRAINT Only_Neptun CHECK (sample LIKE '[A-Z0-9][A-Z0-9][A-Z0-9][A-Z0-9][A-Z0-9][A-Z0-9]')
CONSTRAINT Only_1_to_5  CHECK (sample BETWEEN 1 AND 5)
CONSTRAINT Only_1_to_5  CHECK (sample  >= 1 AND sample <= 5)
CONSTRAINT Only_in_list CHECK (sample IN 'sample1','sample2','sample3','sample4''))
CONSTRAINT Only_HU_Postal_Code  CHECK (sample LIKE '[1-9][0-9][0-9][0-9]')
CONSTRAINT Only_HU_Postal_Code_V2  CHECK (sample LIKE '[1-9][0-9][0-9][0-9]' AND CAST(sample AS smallint) >= 1011)
CONSTRAINT Only_Given_Chars  CHECK (sample LIKE '[fvs]')
CONSTRAINT Only_18_years CHECK(DATEDIFF(yy,sample,GETDATE()) >= 18 )
*/