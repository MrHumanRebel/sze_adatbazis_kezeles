select hallgatok.neptun, vnev, knev, AVG(Cast(jegy as float)) /*As float => ne csak egész számok legyenek*/
from hallgatok inner join jegyek /*Olyan hallgato nem kell akinek nincs jegye*/
on hallgatok.neptun = jegyek.neptun
group by hallgatok.neptun, vnev, knev /*Amit a selectbe beírunk a group by-ba is be kell írni*/
order by 4 DESC /*4. oszlop alapján rendezi csökkenőben, DESC nélkül növekvőben*/
