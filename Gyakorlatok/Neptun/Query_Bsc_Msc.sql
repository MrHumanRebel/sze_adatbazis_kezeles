select Case kforma
when 'Bsc' then 'Alapképzés'
when 'Msc' then 'Mesterképzés'
when 'Phd' then 'Doktori képzés'
else 'Hibás képzés!'
end AS 'Képzési formák',
count(*) AS [Hallgatók száma]
from hallgatok
group by kforma
