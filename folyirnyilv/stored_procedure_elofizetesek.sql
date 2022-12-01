USE FolyirNyilv
GO
/*------------------------------------------------------------------------*/
ALTER SERVER ROLE [sysadmin] ADD MEMBER [G14\Daniel]
/*------------------------------------------------------------------------*/
IF EXISTS (SELECT *
				FROM sys.objects
				WHERE object_id = OBJECT_ID(N'elofizeto')
				)
DROP PROCEDURE dbo.elofizeto
GO
/*------------------------------------------------------------------------*/
CREATE PROCEDURE elofizeto @Enev nvarchar(50), @Eszdat date,  @Eirsz char(4), @Etelep nvarchar(50), @Eutca nvarchar(50)
AS
INSERT INTO ETORZS(ENEV, ESZDAT, EIRSZ, ETELEP, EUTCA)
VALUES ('@Enev', '@Eszdat', '@Eirsz', '@Etelep', '@Eutca');
/*------------------------------------------------------------------------*/
GO