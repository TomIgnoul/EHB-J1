//
// Maak een Product class met een constructor die naam, prijs en voorraad parameters accepteert
// Zorg dat de prijs property niet onder 0 kan komen door een setter te gebruiken
// Zorg dat de voorraad property niet onder 0 kan komen door een setter te gebruiken
// Maak een getter verkoopprijs die de prijs plus 21% BTW teruggeeft
// Maak een getter beschikbaar die true teruggeeft als er voorraad is
// Creëer minstens drie verschillende producten met verschillende eigenschappen
// Toon per product de naam, prijs, verkoopprijs en beschikbaarheid in de 'output' div

class Product {
  constructor(naam, prijs, voorraad) {
    this._naam = naam;
    this._prijs = prijs;
    this._voorraad = voorraad;
  }

  set prijs(value) {
    if (value <= 0) {
      console.log("Prijs kan niet onder nul zijn");
    } else {
      this._prijs = value;
    }
  }

  set voorraad(aantal) {
    if (aantal <= 0) {
      console.log("Ongeldige voorraad");
    } else {
      this._voorraad = aantal;
    }
  }

  get naam() {
    return this._naam;
  }

  get prijs() {
    return this._prijs;
  }

  get verkoopprijs() {
    return this._prijs * 1.21;
  }

  get voorraad() {
    return this._voorraad;
  }

  get beschikbaar() {
    return this._voorraad > 0;
  }

  toonProduct() {
    return `
naam: ${this.naam}<br>
prijs: €${this.prijs}<br>
verkoopprijs: €${this.verkoopprijs.toFixed(2)}<br>
beschikbaar: ${this.beschikbaar ? "ja" : "nee"}<br>
voorraad: ${this.voorraad} stuks<br>
    `;
  }
}

let outputDiv = document.getElementById("output");
let product1 = new Product("henk", 1234, 2);
let product2 = new Product("Chinees", 4312, 4);
let product3 = new Product("Klokje", 4, 98);

let productenLijst = [];

productenLijst.push(product1, product2, product3);

// Toon per product de naam, prijs, verkoopprijs en beschikbaarheid in de 'output' div
productenLijst.forEach((product) => {
  let ul = document.createElement("ul");
  ul.innerHTML = product.toonProduct();
  outputDiv.appendChild(ul);
});
