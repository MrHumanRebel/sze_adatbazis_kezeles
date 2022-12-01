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