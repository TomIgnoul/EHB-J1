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
        console.log("auto is teruggebracht en is beschikbaar"))
      : console.log("Auto was al beschikbaar");

  verhuur = () =>
    this.getBeschikbaar()
      ? (this.setBeschikbaar(false), console.log("auto is nu verhuurd"))
      : console.log("auto is al verhuurd");
}

// Maak een Auto subclass die extra eigenschappen heeft zoals aantalDeuren en brandstofType

class Auto extends Voertuig {
  constructor(merk, model, jaar, verhuurPrijs, aantalDeuren, brandstofType) {
    super(merk, model, jaar, verhuurPrijs);
    this.aantalDeuren = aantalDeuren;
    this.brandstofType = brandstofType;
  }
}

let vt1 = new voertuig("BMW", "3serie", 2025);
console.log(vt1.getBeschikbaar());
vt1.verhuur();
console.log(vt1.getBeschikbaar());
vt1.brengTerug();
