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

-- 5
-- Is voor de tabel planten AVG(hoogte) hetzelfde als SUM(hoogte)/COUNT(hoogte)?
-- Zo ja, waarom? Zo neen, waarom niet?

-- Ja, de som van alle hoogtes gedeeld door het aantal hoogtes wil = gemiddelde

select SUM(HOOGTE) / count(HOOGTE) from PLANTEN;
SELECT AVG(HOOGTE) from planten;


-- SELECT  FROM JOIN  WHERE  GROUP_BY  HAVING  ORDER_BY
-- 6
-- Toon per plantensoort het aantal planten en de gemiddelde verkoopprijs.



-- 7
-- Toon een overzicht met de verschillende kleuren voor vaste planten,
-- en per kleur telkens de prijs van de goedkoopste plant (voor die kleur vaste planten).

-- De prijs van de goedkoopste vaste plant moet bovenaan in de lijst te vinden zijn.
-- select min(prijs) from planten join where soort = vast group_by kleur having order_by

SELECT
    PLANTEN.KLEUR, min(PRIJS) as min_prijs
from
    PLANTEN
where
    soort='vast'
group by
    KLEUR
order by min_prijs asc;

-- 8
-- Maak een overzicht met per artikelcode de laagste en hoogste offerteprijs.
-- a. Uitbreiding: Toon ook de naam van de planten, sorteer alfabetisch

select
    PLANTEN.PLANTENNAAM as naam,
    MIN(OFFERTES.OFF_PRIJS) AS MIN_prijs,
    MAX(OFFERTES.OFF_PRIJS) as MAX_prijs
from
    OFFERTES
    join planten on OFFERTES.ART_CODE = planten.ART_CODE
group by
    PLANTEN.ART_CODE,
    PLANTEN.PLANTENNAAM
order by naam;

select * from planten;

-- 9
-- Wat is de gemiddelde prijs per plantensoort
-- Voor soorten waarvan er minstens 5 planten in het assortiment zitten?

SELECT soort, AVG(prijs)
FROM planten
GROUP BY soort
HAVING COUNT(*) >= 5;


-- 10
-- Toon een lijst waaruit je kan afleiden of het waar is dat planten met korte leveringstijden in het algemeen een hogere gemiddelde offerteprijs hebben.
-- per leveringstijd gemiddelde offerteprijs

select
    round(avg(OFF_PRIJS),2) as gemiddeldeOffPrijs,
    LEV_TIJD,
    lev_code
from
    OFFERTES
group by
    LEV_TIJD,
    lev_code
order by
    LEV_TIJD;


-- 11
-- Wat is de laagste prijs per plantensoort van de planten die in mei of juni bloeien?

select
    min(PRIJS)
from
    PLANTEN
where
    (5 between BLOEIBEGIN and BLOEIEINDE)
    or
    (6 between BLOEIBEGIN and BLOEIEINDE)
group by
    SOORT;

