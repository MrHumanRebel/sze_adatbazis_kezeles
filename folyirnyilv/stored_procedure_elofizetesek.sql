USE FolyirNyilv
GO
/*------------------------------------------------------------------------*/
IF EXISTS (SELECT *
				FROM sys.objects
				WHERE object_id = OBJECT_ID(N'elofizeto')
				)
DROP PROCEDURE dbo.elofizeto
GO
/*------------------------------------------------------------------------*/
CREATE PROCEDURE elofizeto @Ekod char(4), @Enev nvarchar(50), @Eszdat date,  @Eirsz char(4), @Etelep nvarchar(50), @Eutca nvarchar(50)
AS
INSERT INTO ETORZS(EKOD, ENEV, ESZDAT, EIRSZ, ETELEP, EUTCA)
VALUES ('@Ekod', '@Enev', '@Eszdat', '@Eirsz', '@Etelep', '@Eutca');
/*------------------------------------------------------------------------*/
GO