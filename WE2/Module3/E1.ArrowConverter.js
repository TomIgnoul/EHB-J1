// E1: De Arrow Converter
// Zet deze traditionele functies om naar arrow functions
// Gebruik de kortst mogelijke schrijfwijze!
let telOp = (a, b) => a + b;

let isEvenGetal = (getal) => getal % 2 === 0;

let zegHallo = () => "Hallo!";

// Test je functies hier
const output = document.getElementById("outputE1");

// Voeg deze tests toe nadat je de functies hebt herschreven
output.innerHTML += `2 + 3 = ${telOp(2, 3)}<br>`;
output.innerHTML += `Is 4 even? ${isEvenGetal(4)}<br>`;
output.innerHTML += zegHallo();
