-- Oefeningen JOIN
--     1. Toon een lijst met voor alle bestellingen het bestelnummer, de naam van de leverancier, en de leveringsdatum.
--     De lijst moet gesorteerd zijn op leveringsdatum (vroegste eerst), en bij gelijkheid op bestelnummer.
select LEV_NAAM, LEV_DATUM, BESTELNR
from leveranciers join
    bestellingen on leveranciers.LEV_CODE = bestellingen.LEV_CODE
order by LEV_DATUM asc, BESTELNR asc;
--     2. Toon een lijst met de namen van alle vaste planten en de vermelding ‘vaste plant’,
--     gevolgd door de namen van de waterplanten met vermelding ‘waterplant’
select PLANTENNAAM, 'vaste plant' as soort
from PLANTEN
where soort ='vast'
union
select PLANTENNAAM, 'waterplant' as soort
from planten
where soort = 'water';
--     3. Toon een lijst met bestelde planten waarvoor er offertes zijn uitgebracht die lager zijn dan de destijds gehanteerde bestelprijzen. Vermeld enkel de plantnaam en bestelprijs.
-- select from join where
select PLANTENNAAM, BESTELPRIJS
from PLANTEN
    join OFFERTES on PLANTEN.ART_CODE = OFFERTES.ART_CODE
    join BESTELREGELS on planten.art_code = bestelregels.art_code
where OFF_PRIJS < BESTELPRIJS;
--     4. Geef een overzicht dat aangeeft welke planten bij welke leverancier kunnen besteld worden.
--     Toon hierbij de artikelcode, naam van de plant, naam van de leverancier, levertijd en offerteprijs.
--     Sorteer op plantnaam.
select p.art_code, p.plantennaam, l.lev_naam, o.lev_tijd, o.off_prijs
from offertes o
    join planten p on o.ART_CODE = p.ART_CODE
    join leveranciers l on o.lev_code = l.LEV_CODE
order by p.PLANTENNAAM;
--     5. Hoeveel verschillen de gehanteerde bestelprijzen met de huidige offerteprijzen bij dezelfde leverancier?
--     Toon telkens bestelnummer, artikelcode en het positieve of negatieve verschil.
SELECT r.bestelnr, r.art_code, r.bestelprijs - o.off_prijs
FROM bestellingen b
         JOIN bestelregels r ON (b.bestelnr = r.bestelnr)
         JOIN offertes o ON (o.art_code = r.art_code)
WHERE b.lev_code = o.lev_code;

--     6. In welke plaatsen wonen leveranciers die vaste planten aanbieden?
select distinct l.woonplaats
from LEVERANCIERS l
    join offertes o on l.LEV_CODE = o.LEV_CODE
    join planten p on p.art_code = o.ART_CODE
    and p.soort = 'vast';

--     7. Geef een overzicht van alle rode planten die kunnen geleverd worden door leveranciers die niet in Olen gevestigd zijn.
--     Toon hierbij de artikelcode, naam van de plant, soort, naam van de leverancier, gemeente.
--     Sorteer op soort in dalende volgorde en daarbinnen in stijgende volgorde van plantennaam.
select p.art_code,
       p.plantennaam,
       p.soort,
       l.lev_naam,
       l.woonplaats
from planten p
         join offertes o on p.art_code = o.art_code
         join leveranciers l on o.lev_code = l.LEV_CODE
where p.KLEUR = 'rood' and l.woonplaats != 'Olen'
order by p.soort desc,
         p.PLANTENNAAM asc;
--     8. Zoek de bestellingen die een besteldatum hebben die gelijk is aan de leverdatum van één of meer andere bestellingen.
select b1.bestelnr
from bestellingen b1
join bestellingen b2 on b1.lev_datum = b2.BESTELDATUM
where b1.bestelnr <> b2.bestelnr;
--     9. Maak een lijst met plantnaam, hoogte en plantafstand voor de planten: Linde, Gouden Regen en Kruisdistel.
--     Enkel de planten waarvoor de plantafstand is voorzien in de tabel Plantschema mogen getoond worden.
SELECT p.plantennaam,
       p.hoogte,
       s.afstand
FROM planten p, plantschema s
WHERE p.plantennaam IN ('Linde', 'Gouden Regen', 'Kruisdistel')
and p.hoogte between s.HOOGTE1 and s.hoogte2;

--     10. Stel dat we ervan uitgaan dat in de tabel Bestellingen enkel de bestellingen zijn opgenomen die nog niet zijn geleverd.
--     Toon een overzicht waaruit blijkt welke bestellingen werden geplaatst en van welke de leveringsdatum werd overschreden.
--     Toon bestelnummer, naam van de leverancier, en een kolom met de vermelding 'Te laat' ofwel geen vermelding naargelang wat toepasselijk is. Sorteer op bestelnummer.
select b.bestelnr, l.LEV_NAAM, 'te laat'
from LEVERANCIERS l
join bestellingen b on l.lev_code = b.LEV_CODE
where BESTELDATUM < sysdate
union
select b2.bestelnr, l2.LEV_NAAM, ''
from LEVERANCIERS l2
         join bestellingen b2 on l2.lev_code = b2.LEV_CODE
where BESTELDATUM >= sysdate;


--     11. Toon een overzicht van de bomen en de plaats waar deze kunnen besteld worden (in Lisse of in een andere gemeente).
--     Vermeld artikelcode, naam van de boom, leverancierscode en de vermelding Lisse of Andere gemeente naargelang het geval. Sorteer op naam.
select p.PLANTENNAAM, l.lev_code, l.woonplaats, 'Lisse'
from planten p
    join offertes o on p.ART_CODE = o.ART_CODE
    join leveranciers l on o.LEV_CODE = l.LEV_CODE
where l.woonplaats ='Lisse' and p.soort = 'boom'
union
select p.PLANTENNAAM, l.lev_code,l.woonplaats, 'andere gemeente'
from planten p
         join offertes o on p.ART_CODE = o.ART_CODE
         join leveranciers l on o.LEV_CODE = l.LEV_CODE
where l.woonplaats <>'Lisse' and p.soort = 'boom';

--     12. Toon alle planten die later beginnen te bloeien dan de Begonia. Geef naam en bloeibegin.
select plantennaam, BLOEIBEGIN from planten
where bloeibegin > (select bloeibegin from planten where PLANTENNAAM = 'Begonia' );
--     13. Geef paren van planten die dezelfde kleur hebben.
select p1.plantennaam,p1.kleur from planten p1, planten p2
where p1.kleur = p2.kleur
and p1.PLANTENNAAM < p2.PLANTENNAAM;