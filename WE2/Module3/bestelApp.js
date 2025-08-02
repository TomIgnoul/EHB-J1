// E1: Café bestelapp
// Maak een functie 'maakBestelling' met parameters 'drank' en 'snack'
// Gebruik default waardes: bv. drank: "cola" en snack: "chips"
// Return een object met deze waardes
//     Bestelling 1: Geen parameters
//     Bestelling 2: Alleen "fanta" als drank
//     Bestelling 3: "sprite" als drank en "nootjes" als snack
// Bonus: Voeg een timestamp toe aan elke bestelling!

function maakBestelling(drank = "cola", snack = "chips") {
  return {
    drank,
    snack,
    timestamp: new Date().toLocaleDateString(),
  };
}

const bestelling1 = maakBestelling();
const bestelling2 = maakBestelling("fanta");
const bestelling3 = maakBestelling("sprite", "nootjes");

console.log(bestelling1);
console.log(bestelling2);
console.log(bestelling3);
