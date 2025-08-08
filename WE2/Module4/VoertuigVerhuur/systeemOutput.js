import { Voertuig, Auto, Motor } from "./systeem.js";
console.log("JS loaded!");
const Voertuigen = {
  Toyota: new Auto("Toyota", "Yaris", 2020, 50),
  BMW: new Auto("BMW", "3 series", 2021, 80),
  BYD: new Auto("BYD", "Dolphine", 2022, 70),
};
console.log(Voertuigen);
document.addEventListener("DOMContentLoaded", () => {
  var selectCar = document.getElementById("selectCar");
  var verhuurButton = document.getElementById("verhuurButton");

  verhuurButton.addEventListener("click", () => {
    const name = selectCar.value;
    const voertuig = Voertuigen[name];
    console.log(voertuig.verhuur());
  });
});
