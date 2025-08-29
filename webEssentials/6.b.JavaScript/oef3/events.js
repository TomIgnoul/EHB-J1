let knop = document.getElementById("btn1");
let container = document.getElementById("container");

knop.addEventListener("click", () => {
  let newP = document.createElement("p");
  let tekst = document.createTextNode("yes! het werkt!!!!");
  newP.appendChild(tekst);
  container.appendChild(newP);
});
