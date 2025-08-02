// Maak een simpel puntensysteem voor studenten met behulp van JavaScript objecten.

// Maak een Student class met een constructor die naam en vakken parameters accepteert
// Voeg een methode voegPuntToe(vak, punt) toe die een punt toevoegt voor een bepaald vak
// Voeg een methode gemiddelde() toe die het gemiddelde punt van alle vakken berekent
// Voeg een methode toonRapport() toe die een string teruggeeft met alle vakken en punten
// Creëer twee student-objecten met verschillende namen en vakken
// Voeg enkele punten toe aan elke student
// Toon het rapport van elke student in de 'output' div
//

class Student {
  constructor(naam, vakken = {}) {
    this.naam = naam;
    this.vakken = vakken;
  }

  voegPuntToe(vak, punt) {
    if (vak in this.vakken) {
      this.vakken[vak] += punt;
    } else {
      this.vakken[vak] = punt;
    }
  }

  gemiddelde() {
    let som = 0;
    for (let vak in this.vakken) {
      som += this.vakken[vak];
    }
    return (som / Object.keys(this.vakken).length).toFixed(2);
  }

  toonRapport() {
    let studentGem = this.gemiddelde();
    let rapport = `${this.naam}\n`;
    for (let vak in this.vakken) {
      rapport += `${vak} : ${this.vakken[vak]}\n`;
    }
    return rapport + `gemiddelde: ${studentGem}`;
  }
}

// studenten aanmaken
let student1 = new Student("Piet", {
  HTML: 10,
  CSS: 10,
  Java: 7,
  JavaScript: 7,
});
let student2 = new Student("Jan", {
  HTML: 10,
  CSS: 10,
  Java: 8,
  JavaScript: 8,
});

student1.voegPuntToe("Engels", 7);
student2.voegPuntToe("Networking", 8);

let rapportOutput = document.getElementById("output");
rapportOutput.innerText =
  student1.toonRapport() + "\n\n" + student2.toonRapport();
