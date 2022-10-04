select h.neptun, vnev, knev,
AVG(Cast(jegy as float) * kredit)/ SUM(kredit)
from hallgatok h, jegyek j, tantargyak t
where h.neptun = j.neptun and j.tkod = j.tkod
and vdatum = (Select MAX(vdatum) from jegyek j2 /*Alselect*/
where j2.neptun = j.neptun and j2.tkod = j.tkod)
group by h.neptun, vnev, knev /*Amit a selectbe beírunk a group by-ba is be kell írni*/
order by 4 DESC /*4. oszlop alapján rendezi csökkenőben, DESC nélkül növekvőben*/
