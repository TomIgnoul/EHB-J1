-- 1. Geef de namen van alle leveranciers in dalende volgorde.
select lev_naam from leveranciers
order by lev_naam asc;

-- 2. Geef de naam van alle vaste planten, in dalende volgorde.
select PLANTENNAAM, SOORT
from PLANTEN
where SOORT = 'vast'
order by PLANTENNAAM asc;
-- 3. Geef van alle leveranciers de naam en de woonplaats.
--     Extra: probeer de uitvoer als zin te laten verschijnen: “Flora BV. is gevestigd in Aalsmeer”
select lev_naam || ' is gevestigd in ' || woonplaats from LEVERANCIERS;
--
-- 4. Geef de leverancierscodes en de namen van leveranciers waarbij de letter ‘o’ voorkomt in de naam.
select LEV_CODE, lev_naam from leveranciers where lev_naam like '%o%';
-- 5. Geef alle namen van de leveranciers die in Aalsmeer wonen en die een korting geven van minstens 5%.
select LEV_NAAM, korting, WOONPLAATS
from LEVERANCIERS
where WOONPLAATS = 'Aalsmeer' and KORTING >=5  ;

-- 6. Geef de namen van alle vaste planten die minder kosten dan 5 EUR.
select PLANTENNAAM
from PLANTEN
where soort = 'vast' and prijs < 5.0;

-- 7. Geef de artikelcode, naam en soort van alle vaste planten en van alle bomen. Rangeschik ze in dalende volgorde van plantnaam.
select art_code, PLANTENNAAM, SOORT
from PLANTEN
where soort = 'vast' or soort = 'boom'
order by PLANTENNAAM asc;

-- 9. Geef alle gegevens van de planten die een hoogte kunnen bereiken tussen 100 cm en 200 cm.
select * from planten
where hoogte between 100 and 200;

-- 10. Toon alle gegevens van de waterplanten, volgens dalende hoogte.
select * from PLANTEN
where soort = 'water'
order by hoogte desc;

-- 11. Toon de verschillende woonplaatsen (alfabetisch) van onze leveranciers.
select distinct WOONPLAATS from LEVERANCIERS
order by WOONPLAATS asc;
-- 12. Toon een lijst met de verschillende kleuren die in het assortiment voorkomen.
select distinct kleur from planten;
-- 13. Toon de verschillende plantensoorten met een rode kleur (in de bloei)
select * from planten;
-- 14. Toon alle gegevens over planten die meer dan 12.5 euro kosten. In het lijstje mogen geen bomen voorkomen.
select * from planten
where prijs > 12.5 and soort != 'boom';
-- 15. Toon artikelcode en plantnaam van planten waarvan de derde letter in de naam een 'n' is.
    select ART_CODE, PLANTENNAAM from PLANTEN
    where PLANTENNAAM like '__n%';
-- 16. Geef voor de verschillende bomen een overzicht van het aantal maanden dat ze in bloei staan.
select distinct plantennaam, (BLOEIEINDE - BLOEIBEGIN +1 ) as bloeiperiode
from planten where soort = 'boom'
and bloeieinde is not null
             and BLOEIBEGIN is not null;
-- 17. Toon artikelcode en plantnaam van 1-jarige en 2-jarige planten.
select ART_CODE, PLANTENNAAM from planten
where soort in ('1-jarig', '2-jarig');

select ART_CODE, PLANTENNAAM from planten
where soort = '1-jarig' or soort = '2-jarig';


-- 18. Toon alle gegevens van de planten met 'kruid' in de naam, maar zonder de planten die tot de groep kruiden behoren.

select *
from PLANTEN
where PLANTENNAAM
          like '%kruid%' and soort != 'kruid';

-- 19.  Toon de naam van de planten waarvan de naam uit precies 5 karakters bestaat.
select PLANTENNAAM from PLANTEN
where PLANTENNAAM like '_____';
-- 20.  Herhaal voor de planten waarvan de naam uit minstens 5 karakters bestaat
select PLANTENNAAM from PLANTEN
where PLANTENNAAM like '_____%';