
# 4. Geeft de student die de cursus “Android” volgt 10 punten op dit vak.
# Extra: gebruik hiervoor een subquery.
describe Inschrijvingen;
select * from Inschrijvingen;

UPDATE Inschrijvingen
SET Punten = 10
WHERE Cursusnr = (
    SELECT Cursusnr
    FROM Cursussen
    WHERE Cursusnr = 111
);

# 5. De hogeschool beseft zich plots dat een lengte van 15 wel erg kort is voor de Woonplaats van
# hun Docenten. Na de nodige vergaderingen wordt beslist dit te verhogen naar 150. Pas de
# tabel aan.
describe Docenten;

Alter table Docenten
MODIFY Woonplaats VARCHAR(150);

# 6. Wat gebeurt er als we de lengte van het veldje Achternaam in de tabel Studenten verkleinen
# naar 10 karakters?
select * from Studenten;
# -->> niet mogelijk omdat Willigenburg meer dan 10 karakters is.

# 7. Voeg een nieuwe student toe en voeg deze toe aan minstens 2 opleidingen.
describe Studenten;

insert into Studenten(Student_id, Voornaam, Achternaam, Geboortedatum)
values(1234123, "Henk", "Henkens", '1992-06-03');


insert into Inschrijvingen(Student_id, Cursusnr, Kost_betaald, Punten)
values
    (1234123, 111, 70, null),
    (1234123, 123, 90.50, null);


show create table Docenten;
select * from Ancienniteiten;

# 8. De nieuwe student is een uitstekende leerling: Pas de punten van je nieuwe student aan
# zodat de student op alle opleidingen die de student volgt 20 scoort. Doe dit met 1 query.


update Inschrijvingen
set Punten = 20
where Student_id = 1234123;


# 9. Er wordt beslist dat de docent “Leena Schmidt” de vakken van “Hans Beenhakker” zal
# overnemen. Pas de databank aan om deze wijziging te reflecteren en gebruik hiervoor een
# subquery.

select * from Inschrijvingen;
select * from Cursussen;
describe Cursussen;
select * from Docenten;
select * from Specialisaties;

update Cursussen
set Docent_id = ( select Docent_id from Docenten where Achternaam = "Beenhakker" and Voornaam = "Hans")
where Docent_id = (select Docent_id from Docenten where Achternaam = "Schmidt" and Voornaam = "Leena");


update Cursussen
set Docent_id =(select Docent_id from Docenten where Achternaam = "Schmidt" and Voornaam = "Leena")
where Docent_id = ( select Docent_id from Docenten where Achternaam = "Beenhakker" and Voornaam = "Hans");