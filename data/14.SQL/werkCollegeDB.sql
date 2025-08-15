--Toeleveringsadministratie
DROP TABLE leveringen;
DROP TABLE producten;
DROP TABLE projecten;
DROP TABLE leveranciers;

CREATE TABLE leveranciers (
	levnr	NUMBER(4),
	levnaam	VARCHAR2(20),
	status	NUMBER(2),
	stad	VARCHAR2(20),
	PRIMARY KEY (levnr)
);

CREATE TABLE projecten (
	projnr		NUMBER(4),
	projnaam	VARCHAR2(20),
	stad		VARCHAR2(20),
	PRIMARY KEY(projnr)
);

CREATE TABLE producten (
	prodnr		NUMBER(4),
	prodnaam	VARCHAR2(20),
	kleur		VARCHAR2(10),
	gewicht		NUMBER(5),
	stad		VARCHAR2(20),
	PRIMARY KEY(prodnr)
);

CREATE TABLE leveringen (
	levnr	NUMBER(4),
	prodnr	NUMBER(4),
	projnr	NUMBER(4),
	hoev	NUMBER(4),
	PRIMARY KEY(levnr, prodnr, projnr),
	FOREIGN KEY(levnr) REFERENCES leveranciers(levnr),
	FOREIGN KEY(prodnr) REFERENCES producten(prodnr),
	FOREIGN KEY(projnr) REFERENCES projecten(projnr)
);

