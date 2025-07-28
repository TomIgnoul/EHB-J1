-- 1
SELECT
    BESTELLINGEN.Bestelnr,
    BESTELLINGEN.lev_datum,
    LEVERANCIERS.lev_naam
FROM
    LEVERANCIERS
        JOIN
    BESTELLINGEN ON LEVERANCIERS.LEV_CODE = BESTELLINGEN.LEV_CODE
ORDER BY
    BESTELLINGEN.lev_datum,
    BESTELLINGEN.BESTELNR;

-- 2
SELECT PLANTENNAAM, 'vasteplant' as soort
from PLANTEN
where soort = 'vast'
union
select plantennaam, 'waterplant'
from PLANTEN
where soort ='water';

-- 3
select distinct
    PLANTEN.plantennaam,
    BESTELREGELS.Bestelprijs
FROM BESTELREGELS
         JOIN PLANTEN ON BESTELREGELS.ART_CODE = PLANTEN.ART_CODE
         JOIN OFFERTES on PLANTEN.ART_CODE = OFFERTES.ART_CODE
where
    OFFERTES.OFF_PRIJS <  BESTELREGELS.BESTELPRIJS;

-- 4
select
    PLANTEN.ART_CODE,
    PLANTEN.plantennaam,
    LEVERANCIERS.LEV_NAAM,
    OFFERTES.LEV_TIJD,
    OFFERTES.OFF_PRIJS
FROM
    PLANTEN
        JOIN OFFERTES ON PLANTEN.ART_CODE = OFFERTES.ART_CODE
        JOIN LEVERANCIERS ON OFFERTES.LEV_CODE = LEVERANCIERS.LEV_CODE
order by
    PLANTENNAAM;

-- 5
-- Hoeveel verschillen de gehanteerde bestelprijzen met de huidige offerteprijzen
-- bij dezelfde leverancier?
-- Toon telkens bestelnummer, artikelcode en het positieve of negatieve verschil.
select
    BESTELLINGEN.BESTELNR,
    OFFERTES.art_code,
    (OFFERTES.OFF_PRIJS - BESTELREGELS.bestelprijs) As verschil
from LEVERANCIERS
    join BESTELLINGEN on LEVERANCIERS.LEV_CODE = BESTELLINGEN.LEV_CODE
    JOIN BESTELREGELS ON BESTELLINGEN.BESTELNR = BESTELREGELS.BESTELNR
    join OFFERTES ON
    LEVERANCIERS.LEV_CODE = OFFERTES.LEV_CODE and
    BESTELREGELS.ART_CODE = OFFERTES.ART_CODE;

-- 6
-- In welke plaatsen wonen leveranciers die vaste planten aanbieden?
select distinct
    LEVERANCIERS.woonplaats
from
    LEVERANCIERS
    join offertes on LEVERANCIERS.LEV_CODE = offertes.LEV_CODE
    join planten on offertes.ART_CODE = planten.ART_CODE
where
    planten.soort = 'vast';

-- 7
-- Geef een overzicht van alle rode planten
-- die kunnen geleverd worden door leveranciers die niet in Olen gevestigd zijn.
-- Toon hierbij de artikelcode, naam van de plant, soort, naam van de leverancier, gemeente.
-- Sorteer op soort in dalende volgorde en daarbinnen in stijgende volgorde van plantennaam.

select distinct
       PLANTEN.art_code,
       PLANTEN.PLANTENNAAM,
       PLANTEN.soort,
       LEVERANCIERS.LEV_NAAM,
       leveranciers.woonplaats
FROM PLANTEN
    JOIN OFFERTES ON PLANTEN.ART_CODE = OFFERTES.ART_CODE
    JOIN LEVERANCIERS ON OFFERTES.LEV_CODE = LEVERANCIERS.LEV_CODE
WHERE
    LEVERANCIERS.WOONPLAATS != 'Olen'
order by
    soort desc,
    PLANTENNAAM;

-- 8
-- Zoek de bestellingen
-- die een besteldatum hebben die
-- gelijk is aan de leverdatum van één of meer andere bestellingen.

SELECT b1.bestelnr
FROM bestellingen b1
         JOIN bestellingen b2 ON (b1.besteldatum = b2.lev_datum)
WHERE b1.bestelnr != b2.bestelnr;

-- 9
-- Maak een lijst met plantnaam, hoogte en plantafstand
-- voor de planten: Linde, Gouden Regen en Kruisdistel.
-- Enkel de planten waarvoor de plantafstand is voorzien
-- in de tabel Plantschema mogen getoond worden.

select
    p.PLANTENNAAM,
    p.Hoogte,
    s.AFSTAND
from
    PLANTEN p,
    PLANTSCHEMA s
where p.hoogte between s.HOOGTE1 and s.HOOGTE2
    and p.plantennaam in ('Linde', 'Gouden Regen', 'Kruisdistel');

-- 10Stel dat we ervan uitgaan dat in de tabel Bestellingen
-- enkel de bestellingen zijn opgenomen die nog niet zijn geleverd.
-- Toon een overzicht waaruit blijkt welke bestellingen werden geplaatst
-- en van welke de leveringsdatum werd overschreden.
-- Toon bestelnummer, naam van de leverancier,
-- en een kolom met de vermelding 'Te laat'
-- ofwel
-- geen vermelding naargelang wat toepasselijk is.
-- Sorteer op bestelnummer.
-- lev_datum < now()

select
    Bestellingen.BESTELNR,
    Leveranciers.Lev_naam,
    BESTELLINGEN.lev_datum,
    case
        when BESTELLINGEN.LEV_DATUM < current_date then 'te laat'
            ELSE ''
        END AS status
from Bestellingen
    join
    Leveranciers on Bestellingen.LEV_CODE = Leveranciers.LEV_CODE
order by
    BESTELLINGEN.BESTELNR;

-- 11
--Toon een overzicht van de bomen en de plaats waar deze kunnen besteld worden
-- (in Lisse of in een andere gemeente).
-- Vermeld artikelcode, naam van de boom,
-- leverancierscode en de vermelding Lisse of Andere gemeente naargelang het geval.
-- Sorteer op naam.

select distinct
    LEVERANCIERS.lev_code,
    PLANTEN.plantennaam,
    LEVERANCIERS.lev_code,
    case
        when LEVERANCIERS.woonplaats = 'Lisse' then LEVERANCIERS.WOONPLAATS
            else 'Gemeente'
        end as status
from LEVERANCIERS
    join OFFERTES on LEVERANCIERS.LEV_CODE = OFFERTES.LEV_CODE
    join planten on OFFERTES.ART_CODE = planten.ART_CODE
where
    planten.SOORT = 'boom'
order by planten.plantennaam;

-- 12
-- Toon alle planten die later beginnen te bloeien dan de Begonia.
-- Geef naam en bloeibegin.

SELECT
    planten.plantennaam,
    planten.bloeibegin
FROM
    planten
WHERE
    planten.bloeibegin > (
        SELECT bloeibegin
        FROM planten
        WHERE plantennaam = 'Begonia'
    );

    --andere benadering
select
    P2.PLANTENNAAM, P2.BLOEIBEGIN
FROM
    PLANTEN P1, PLANTEN P2
WHERE
    P1.PLANTENNAAM= 'Begonia'
    and p2.BLOEIBEGIN >p1.BLOEIBEGIN;

--13
-- Geef paren van planten die dezelfde kleur hebben.

select
    p1.plantennaam, p2.PLANTENNAAM, p1.kleur
from planten p1, planten p2
where p1.kleur = p2.KLEUR
and p1.plantennaam < p2.plantennaam;