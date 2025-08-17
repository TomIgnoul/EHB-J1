-- 1. Bepaal de hoogte van de hoogste boom.
    select max(HOOGTE) from planten;
--     2. Bepaal het totale bedrag van de bestellingen voor de artikelcode ‘123’.
    select sum(AANTAL * BESTELPRIJS) from BESTELREGELS
    where ART_CODE = 123;
--     3. Bepaal het aantal artikelen in bestelling.
    select sum(AANTAL) from BESTELREGELS;
--     4. Bepaal het aantal verschillende artikelen in bestelling.
select count(ART_CODE)from BESTELREGELS;
--     5. Is voor de tabel planten AVG(hoogte) hetzelfde als SUM(hoogte)/COUNT(hoogte)? Zo ja, waarom? Ze neen, waarom niet?
--     6. Toon per plantensoort het aantal planten en de gemiddelde verkoopprijs.
    select soort,
           round(avg(prijs),2),
           count(*) aantal
    from planten
    group by soort ;
--     7. Toon een overzicht met de verschillende kleuren voor vaste planten,
--     en per kleur telkens de prijs van de goedkoopste plant (voor die kleur vaste planten).
--     De prijs van de goedkoopste vaste plant moet bovenaan in de lijst te vinden zijn.
select soort,
       min(PRIJS) goedkoopste
from planten
where soort = 'vast'
group by kleur, SOORT
order by goedkoopste;
--     8. Maak een overzicht met per artikelcode de laagste en hoogste offerteprijs.
--         a. Uitbreiding: Toon ook de naam van de planten, sorteer alfabetisch
    select p.PLANTENNAAM,
           p.art_code,
           min(o.OFF_PRIJS),
           max(o.off_prijs)
    from planten p
    join offertes o on p.ART_CODE = o.ART_CODE
    group by p.PLANTENNAAM, p.art_code
    order by p.PLANTENNAAM;

--     9. Wat is de gemiddelde prijs per plantensoort, voor soorten waarvan er minstens 5 planten in het assortiment zitten?
    select round(avg(p.prijs),2),
           p.soort
    from planten p
    group by p.soort
    having count(*) >= 5;

--     10. Toon een lijst waaruit je kan afleiden of het waar is dat planten met korte leveringstijden in het algemeen een hogere gemiddelde offerteprijs hebben.
select round(avg(o.OFF_PRIJS),2),
       plantennaam
from offertes o
join planten p on o.ART_CODE = p.ART_CODE
group by o.LEV_TIJD,
         p.PLANTENNAAM
order by o.LEV_TIJD;

--     11. Wat is de laagste prijs per plantensoort van de planten die in mei of juni bloeien?
select min(prijs),
       soort
from planten
where(5 between BLOEIBEGIN and BLOEIEINDE) and
     (6 between bloeibegin and bloeieinde)
group by soort;
