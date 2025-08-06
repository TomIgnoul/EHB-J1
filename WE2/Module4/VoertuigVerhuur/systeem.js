// Maak een basis Voertuig class met eigenschappen: merk, model, jaar, verhuurPrijs en beschikbaar (Boolean)

class Voertuig {
  constructor(merk, model, jaar, verhuurPrijs) {
    this.merk = merk;
    this.model = model;
    this.jaar = jaar;
    this.verhuurPrijs = verhuurPrijs;
    this.beschikbaar = true;
  }

  // Maak een methode verhuur() die de beschikbaarheid op false zet en een bericht teruggeeft

  setBeschikbaar(isBeschikbaar) {
    this.beschikbaar = isBeschikbaar;
  }

  getBeschikbaar() {
    return this.beschikbaar;
  }

  brengTerug = () =>
    !this.getBeschikbaar()
      ? (this.getBeschikbaar(true),
        console.log("Voertuig is teruggebracht en is beschikbaar"))
      : console.log("Voertuig was al beschikbaar");

  verhuur = () =>
    this.getBeschikbaar()
      ? (this.setBeschikbaar(false), console.log("Voertuig is nu verhuurd"))
      : console.log("Voertuig is al verhuurd");
}

// Maak een Auto subclass die extra eigenschappen heeft zoals aantalDeuren en brandstofType

class Auto extends Voertuig {
  constructor(merk, model, jaar, verhuurPrijs, aantalDeuren, brandstofType) {
    super(merk, model, jaar, verhuurPrijs);
    this.aantalDeuren = aantalDeuren;
    this.brandstofType = brandstofType;
  }

  verhuur = () =>
    this.getBeschikbaar()
      ? (this.setBeschikbaar(false), console.log("auto is nu verhuurd"))
      : console.log("auto is al verhuurd");
}

//Maak een Motor subclass met extra eigenschappen zoals cilinderinhoud en type (sport, tour, etc.)

class Motor extends Voertuig {
  constructor(merk, model, jaar, verhuurPrijs, cilinderinhoud, type) {
    super(merk, model, jaar, verhuurPrijs);
    this.cilinderinhoud = cilinderinhoud;
    this.type = type;
  }

  verhuur = () =>
    this.getBeschikbaar()
      ? (this.setBeschikbaar(false),
        console.log(`Motor van ${this.type} is nu verhuurd`))
      : console.log("Motor is al verhuurd");
}

// Overschrijf de verhuur methode in beide subclasses om extra specifieke informatie in het bericht op te nemen

let vt1 = new Voertuig("BMW", "3serie", 2025);
let motor1 = new Motor("Yamaha", "R1", 2022, 150, 1000, "Sport");
console.log(vt1.getBeschikbaar());
vt1.verhuur();
console.log(vt1.getBeschikbaar());
vt1.brengTerug();
motor1.verhuur();
motor1.verhuur();
