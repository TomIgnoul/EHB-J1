-- Expert
create TABLE expert(
expertID int not null auto_increment,
primary key (expertID));

CREATE TABLE expert (
    expertID INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (expertID)
);

ALTER TABLE expert 
ADD expertVoornaam varchar(255) NOT NULL,
ADD expertAchternaam varchar(255) NOT NULL,
ADD expertExpertise varchar(255) NOT NULL,
ADD expertUurloon decimal(3,2) NOT NULL;

-- If adding multiple columns in one go → ADD before each column (MySQL requires it).

-- locatie
CREATE TABLE locatie(
locatieID int AUTO_INCREMENT,
locatieNaam varchar(255) NOT NULL,
PRIMARY KEY(locatieID));

-- If auto_increment, NOT_NULL is not necissary

-- klant
CREATE TABLE klant(
klantID int AUTO_INCREMENT,
klantType ENUM('particulier', 'bedrijf') NOT NULL,
klantTelNR int(11),
klantEmail varchar(255),
PRIMARY KEY(klantID));

-- child tables ( afhankelijk van de parent-tables)

-- Evenement
-- particulier
-- bedrijf

evenement
CREATE TABlE evenement(
evID int AUTO_INCREMENT,
locatieID int,
evNaam VARCHAR(255) NOT NULL,
evDatum DATE NOT NULL,
evTijdstip int(4) NOT NULL,
evDuur int NOT NULL,
evTicketPrijs decimal(4,2),
PRIMARY KEY(evID),
FOREIGN KEY(locatieID) REFERENCES locatie(locatieID));

-- MySQL Date Data Types
-- MySQL comes with the following data types for storing a date or a date/time value in the database:
-- DATE - format YYYY-MM-DD
-- DATETIME - format: YYYY-MM-DD HH:MI:SS
-- TIMESTAMP - format: YYYY-MM-DD HH:MI:SS
-- YEAR - format YYYY or YY
-- Note: The date data type are set for a column when you create a new table in your database!

-- AUTO INCREMENT not needed when adding the foreign key (as this is allready declared in the table where the FK is PK)

-- particulier
CREATE TABLE particulier(
klantID int,
particulierVoornaam VARCHAR(255) NOT NULL,
particulierAchternaam VARCHAR(255) NOT NULL,
PRIMARY KEY (klantID),
FOREIGN KEY (klantID) REFERENCES klant(klantID));

-- bedrijf
CREATE TABLE bedrijf(
klantID int, 
bedrijfsnaam VARCHAR(255),
PRIMARY KEY(klantID),
FOREIGN KEY(klantID) REFERENCES klant(klantID)
);

-- expert_evenementen
-- factuur
-- ticket_aankoop


-- expert_evenementen
CREATE TABLE expert_evenementen(
expertID int,
evID int, 
PRIMARY KEY(expertID, evID),
FOREIGN KEY(expertID) REFERENCES expert(expertID),
FOREIGN KEY(evID) REFERENCES evenement(evID)
);


-- factuur
CREATE TABLE factuur(
factuurID INT AUTO_INCREMENT,
klantID INT,
factuurdatum DATE,
PRIMARY KEY(factuurID),
FOREIGN KEY(klantID) REFERENCES klant(klantID)
);

-- ticket_aankoop
CREATE TABLE ticket_aankoop(
ticketID INT AUTO_INCREMENT,
klantID INT,
factuurID INT,
evID INT,
aantal INT DEFAULT 1,
PRIMARY KEY(ticketID),
FOREIGN KEY(klantID) REFERENCES klant(klantID),
FOREIGN KEY(factuurID) REFERENCES factuur(factuurID),
FOREIGN KEY(evID) REFERENCES evenement(evID)
);