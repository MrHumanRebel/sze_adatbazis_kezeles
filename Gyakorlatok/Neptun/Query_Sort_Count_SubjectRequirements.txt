select tkov, count(tkov) AS 'Előkövetelmény tárgyak száma:'
from tantargyak
group by tkov
