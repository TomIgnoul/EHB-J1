-- 1
-- Toon een lijst met de planten die even goedkoop of goedkoper zijn
-- dan de goedkoopste vaste plant. Vermeld naam, prijs en soort.

select
    PLANTENNAAM,
    PRIJS,
    soort
from
    PLANTEN
where
    prijs <= ( select min(PRIJS) from PLANTEN where SOORT='vast');

-- 2
-- Toon een lijst met naam en prijs van de duurste boom (of bomen).

select PLANTENNAAM, PRIJS, soort
from PLANTEN
where soort = 'boom'
    and prijs = (select max(prijs) from planten where soort = 'boom');

-- 3
-- Toon een lijst met voor alle vaste planten de gunstigste offerteprijzen.
-- Vermeld artikelcode, leverancierscode en offerteprijs.

select o.ART_CODE, lev_code, OFF_PRIJS
from OFFERTES o
    join planten p on o.ART_CODE = p.ART_CODE
where SOORT = 'vast' and o.OFF_PRIJS = (select MIN(OFF_PRIJS)
                                      from OFFERTES o2 join
                                          planten on o2.ART_CODE = planten.ART_CODE
                                      where o2.ART_CODE = o.ART_CODE);


-- 4
-- Toon een lijst met alle gegevens over de leveranciers
-- waarbij bestellingen werden geplaatst met
-- een leveringsdatum vóór vandaag,
-- sorteer op leveranciersnaam. Los op met en zonder subquery.

SELECT DISTINCT l.*
FROM LEVERANCIERS l
         JOIN BESTELLINGEN b ON l.LEV_CODE = b.LEV_CODE
WHERE b.LEV_datum < CURRENT_DATE
ORDER BY l.LEV_NAAM;


select *
from LEVERANCIERS l
where exists (select 1
                      from BESTELLINGEN b
                      where b.LEV_CODE = l.LEV_CODE
                      and b.LEV_DATUM < current_date
                      )
order by l.LEV_NAAM;

-- 5
-- Welke planten zijn hoger dan de hoogste vaste plant en tevens goedkoper dan de gemiddelde prijs van alle planten?

select PLANTENNAAM, hoogte, prijs
from planten p
where hoogte > (select max(hoogte)
                from planten
                where SOORT = 'vast')

and PRIJS < (select avg(PRIJS)
               from planten );


--  6
-- Toon een lijst met de bestelnummers van de bestellingen waarbij een korting van minstens 5% werd toegekend.

select BESTELNR
from BESTELLINGEN
join LEVERANCIERS on BESTELLINGEN.LEV_CODE = LEVERANCIERS.LEV_CODE
where korting >= 5;

-- 7
-- Toon een lijst met artikelcode, leveranciersnaam en offerteprijs voor die planten
-- waarvoor de offerteprijs in kwestie lager is dan de gemiddelde offerteprijs voor die plant.
-- Sorteer op artikelcode.

select  l.lev_naam,
        o.art_code,
        o.OFF_PRIJS
from OFFERTES o
join leveranciers l on o.LEV_CODE = l.LEV_CODE
where off_prijs < (select avg(OFF_PRIJS) from offertes o2 where o2.art_code = o.art_code)
order by o.ART_CODE;

-- 8.
-- Toon een lijst met planten
-- die werden besteld aan een prijs die hoger is dan de maximum offerteprijs die nu voor die plant geldt.
-- Vermeld bestelnummer, naam van de leverancier, artikelcode van de plant, naam van de plant en bestelprijs.

-- bestelprijs > maximum off_prijs

select b.BESTELNR,
       b.BESTELPRIJS,
       l.lev_naam,
       p.ART_CODE,
       p.PLANTENNAAM
from planten p
join bestelregels b on p.ART_CODE = b.ART_CODE
join offertes o on p.ART_CODE = o.ART_CODE
join leveranciers l on o.LEV_CODE = l.LEV_CODE
where b.BESTELPRIJS > (select max(o2.OFF_PRIJS)
                       from OFFERTES o2
                       where o2.ART_CODE = p.ART_CODE);

-- 9
-- Toon een lijst met de planten die besteld werden bij leverancier "Hovenier G.H.".
-- Sorteer op artikelcode.
-- Vermeld artikelcode, bestelnummer, aantal stuks, bestelprijs, en het totale bedrag.

select b.ART_CODE, b.BESTELNR, b.AANTAL, b.BESTELPRIJS, BESTELLINGEN.bedrag
from BESTELREGELS b
join BESTELLINGEN on b.BESTELNR = BESTELLINGEN.BESTELNR
join leveranciers on BESTELLINGEN.LEV_CODE = leveranciers.LEV_CODE
where LEV_NAAM = 'Hovenier G.H.'
order by ART_CODE;

-- 10
-- Toon de planten waarvoor geen offerteprijs bestaat.

select planten.plantennaam from planten
where art_code not in ( select art_code from Offertes );

--  11
-- Geef alle leveranciersgegevens van de leveranciers waarbij het plantencentrum niets in bestelling heeft.

select *
from leveranciers l
where l.lev_code not in (select lev_code from BESTELLINGEN);

-- 12
--Geef de leveranciersgegevens en de planten (plantennaam)
-- die bij hem in bestelling staan
-- van alle leveranciers die een kleinere korting geven dan de gemiddelde korting.

SELECT l.*, plantennaam
FROM leveranciers l
         JOIN bestellingen b ON (l.lev_code = b.lev_code)
         JOIN bestelregels br ON (b.bestelnr = br.bestelnr)
         JOIN planten p ON (br.art_code = p.art_code)
WHERE korting < (SELECT AVG(korting) FROM leveranciers)
order by PLANTENNAAM;

-- 13
-- Geef namen van leveranciers met minsten twee bestellingen

select l.LEV_NAAM, count(BESTELNR) as aantal_bestellingen
from
    LEVERANCIERS l
    join bestellingen b on l.LEV_CODE = b.LEV_CODE
group by l.LEV_NAAM
    having count(b.BESTELNR) >= 2;

-- 14
-- Geef naam van artikelen die zowel bij leverancier 4 als bij leverancier 13 in bestelling staan.

select PLANTENNAAM
from PLANTEN
join BESTELREGELS br on PLANTEN.ART_CODE = br.ART_CODE
join bestellingen b on br.BESTELNR = b.BESTELNR
where LEV_CODE in (4, 13)
group by PLANTENNAAM;

SELECT plantennaam
FROM planten p
WHERE art_code IN (SELECT art_code
                   FROM bestelregels br
                            JOIN bestellingen b ON (br.bestelnr = b.bestelnr)
                   WHERE lev_code = 4)
  AND art_code IN (SELECT art_code
                   FROM bestelregels br
                            JOIN bestellingen b ON br.bestelnr = b.bestelnr
                   WHERE lev_code = 13);

-- 15
-- Op welke bestelling(en) staat het minst aantal verschillende artikelen. Geef bestelnr en dat kleinste aantal.

select BESTELNR, count(distinct art_code)
from  BESTELREGELS
group by BESTELNR
having count(distinct art_code) = (select min(count( distinct ART_CODE)) from BESTELREGELS group by BESTELNR)

-- 16
-- Geef de bestellingen waar alle planten besteld worden.
SELECT bestelnr
FROM bestelregels
GROUP BY bestelnr
HAVING COUNT(DISTINCT art_code) = (SELECT count(art_code) FROM planten);

-- 17
-- Geef de bestellingen waar minstens die artikelen werden besteld als op bestelling 121
SELECT bestelnr
FROM bestellingen br1
WHERE NOT EXISTS (SELECT *
                  FROM bestelregels
                  WHERE bestelnr = 121
                    AND art_code NOT IN (SELECT art_code
                                         FROM bestelregels br2
                                         WHERE br2.bestelnr = br1.bestelnr));


