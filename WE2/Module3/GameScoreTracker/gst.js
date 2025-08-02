// Maak een functie verwerkScore met:
//     naam parameter (default: "Onbekend")
//     score parameter (default: 0)
// Valideer de input:
//     Check of score een geldig nummer is
//     Check of naam niet leeg is
// Return een scoreobject

// JavaScript
const voegScoreToe = () => {
  const naamInput = document.getElementById("playerName").value;
  const scoreInput = document.getElementById("score").value;

  const geldigeNaam =
    typeof naamInput === "string" && naamInput.trim().length > 0
      ? naamInput
      : "onbekend";
  const geldigeScore = isNaN(scoreInput) ? 0 : Number(scoreInput);

  const scoreBoard = document.getElementById("scoreBoard");
  scoreBoard.innerText = `${geldigeNaam} heeft ${geldigeScore} punten!`;

  return {
    naam: geldigeNaam,
    score: geldigeScore,
  };
};
