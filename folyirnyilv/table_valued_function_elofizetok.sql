USE FolyirNyilv
GO
/*------------------------------------------------------------------------*/
ALTER SERVER ROLE [sysadmin] ADD MEMBER [G14\Daniel]
/*------------------------------------------------------------------------*/
IF EXISTS (SELECT *
				FROM sys.objects
				WHERE object_id = OBJECT_ID(N'elofizetok')
				)
DROP FUNCTION dbo.elofizetok
GO
/*------------------------------------------------------------------------*/

CREATE FUNCTION elofizetok (@Telep nvarchar(50))
RETURNS TABLE
AS
RETURN
(
    SELECT ENEV, EIRSZ + ' ' + ETELEP + ' ' + EUTCA AS 'Cim'
    FROM ETORZS
    WHERE ETELEP = @Telep
);
GO