import { Voertuig, Auto, Motor } from "./systeem.js";

const Voertuigen = [];

const Toyota = new Auto("Toyota", "Yaris", 2020, 50);
const BMW = new Auto("BMW", "3 series", 2021, 80);
const BYD = new Auto("BYD", "Dolphine", 2022, 70);

Voertuigen.push(Toyota, BMW, BYD);

document.addEventListener("DOMContentLoaded", () => {
  var selectCar = document.getElementById("selectCar");
  var verhuurButton = document.getElementById("verhuurButton");

  verhuurButton.addEventListener("click", () => {
    const name = selectCar.value;
    const voertuig = Voertuigen[name];
    console.log(voertuig.verhuur());
  });
});

function createTable() {
  const carDisplay = document.createElement("table");
  carDisplay.setAttribute("border", "1");
  const headerRow = document.createElement("tr");
  Object.keys(Voertuigen[0]).forEach((key) => {
    const th = document.createElement("th");
    th.appendChild(document.createTextNode(key));
    headerRow.appendChild(th);
  });
  carDisplay.appendChild(headerRow);

  Voertuigen.forEach((item) => {
    const row = document.createElement("tr");
    Object.values(item).forEach((value) => {
      const td = document.createElement("td");
      td.appendChild(document.createTextNode(value));
      row.appendChild(td);
    });
    carDisplay.appendChild(row);
  });
  document.getElementById("carDisplay").appendChild(carDisplay);
}

createTable();
