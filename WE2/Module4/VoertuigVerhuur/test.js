import { Voertuig, Auto, Motor } from "./systeem.js";

const Voertuigen = [];

const Toyota = new Auto("Toyota", "Yaris", 2020, 50);
const BMW = new Auto("BMW", "3 series", 2021, 80);
const BYD = new Auto("BYD", "Dolphine", 2022, 70);

Voertuigen.push(Toyota, BMW, BYD);
