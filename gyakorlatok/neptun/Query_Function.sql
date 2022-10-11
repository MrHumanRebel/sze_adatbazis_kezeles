create function TelepulesKeres
(@telep nvarchar(50))
returns table as 
return

(select neptun,vnev+' '+knev as 'Név', telepules
from hallgatok
where telepules = @telep)
