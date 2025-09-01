let btn = document.getElementById("btn1");
btn.addEventListener("click", () => {
  console.log("het werkt!");
});

function voegDivToe() {
  let btn = document.getElementById("btn1");
  let container = document.getElementById("container");

  btn.addEventListener("click", () => {
    let newP = document.createElement("p");
    let tekst = document.createTextNode("Yes het werkt!");
    newP.appendChild(tekst);
    container.appendChild(newP);
  });
}

voegDivToe();
