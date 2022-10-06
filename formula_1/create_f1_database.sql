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