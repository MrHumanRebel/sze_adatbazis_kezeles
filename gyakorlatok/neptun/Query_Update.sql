USE HallgatoiNyilvanT
update jegyek
set jegy = jegy+1
from hallgatok h inner join jegyek j
on h.neptun=j.neptun
where lany = 'false' and jegy <5 and vdatum=(select max(vdatum)
from jegyek j2 where j2.neptun=j.neptun and j2.tkod=j.tkod)
