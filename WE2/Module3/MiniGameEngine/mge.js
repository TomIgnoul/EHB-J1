// Mini Game Engine
// Bouw een kleine game engine die verschillende concepten combineert.
// Maak deze arrow functions:
//     maakSpeler(naam = "Player 1") => object met naam, level (1), health (100)
//     doeSchade(speler, schade) => update health, niet onder 0
//     levelOmhoog(speler) => verhoog level, reset health naar 100

let speler;
maakNieuweSpeler = (naam = "player 1", level = 1, health = 100) => {
  const playerName = document.getElementById("playerName").value;
  const geldigeNaam = playerName.trim() === "" ? naam : playerName;
  speler = {
    naam: geldigeNaam,
    level,
    health,
  };

  const playerStats = document.getElementById("playerStats");
  playerStats.innerText = `
  naam: ${speler.naam}
  level: ${speler.level}
  health: ${speler.health}
   `;
};

doeSchadeBijSpeler = () => {
  speler.health = Math.max(0, speler.health - 25);

  const playerStats = document.getElementById("playerStats");
  playerStats.innerText = `
  naam: ${speler.naam}
  level: ${speler.level}
  health: ${speler.health}
   `;
};

levelSpelerOp = () => {
  speler.level = speler.level + 1;
  speler.health = 100;
  const playerStats = document.getElementById("playerStats");
  playerStats.innerText = `
  naam: ${speler.naam}
  level: ${speler.level}
  health: ${speler.health}
  `;
};
