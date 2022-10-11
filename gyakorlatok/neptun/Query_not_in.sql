USE HallgatoiNyilvanT
select *
from hallgatok
where neptun NOT IN (select neptun from jegyek)
