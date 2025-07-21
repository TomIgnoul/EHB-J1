// Maak een functie 'maakBestelling' met parameters 'drank' en 'snack'
// Gebruik default waardes: bv. drank: "cola" en snack: "chips"
// Return een object met deze waardes
//     Bestelling 1: Geen parameters
//     Bestelling 2: Alleen "fanta" als drank
//     Bestelling 3: "sprite" als drank en "nootjes" als snack
// Bonus: Voeg een timestamp toe aan elke bestelling!

function maakBestelling(drank, snack) {
  return {
    drank,
    snack,
    tijd: new Date().toLocaleString(),
  };
}

console.log(maakBestelling());
console.log(maakBestelling("fanta"));
console.log(maakBestelling("Sprite", "nootjes"));
