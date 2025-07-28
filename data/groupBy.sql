-- 1
--Bepaal de hoogte van de hoogste boom
-- SELECT  FROM JOIN  WHERE  GROUP_BY  HAVING  ORDER_BY
select max(HOOGTE) from planten
where soort = 'boom';


-- 2
-- Bepaal het totale bedrag van debestellingen voor de artikelcode '123'
select sum(aantal * BESTELPRIJS)
from
    BESTELLINGEN
join
    BESTELREGELS on BESTELLINGEN.BESTELNR = BESTELREGELS.BESTELNR
where
    ART_CODE = '123';

-- 3
-- Bepaal het aantal artikelen in bestelling.

select sum(AANTAL) from BESTELREGELS;

-- 4
-- Bepaal het aantal verschillende artikelen in bestelling.
select count(distinct art_code) from BESTELREGELS;
