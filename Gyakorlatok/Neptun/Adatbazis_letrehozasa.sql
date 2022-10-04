USE master
GO

IF  EXISTS (
	SELECT name 
		FROM sys.databases 
		WHERE name = N'HallgatoiNyilvanT'
)
DROP DATABASE HallgatoiNyilvanT
GO

CREATE DATABASE HallgatoiNyilvanT
GO

USE HallgatoiNyilvanT
GO