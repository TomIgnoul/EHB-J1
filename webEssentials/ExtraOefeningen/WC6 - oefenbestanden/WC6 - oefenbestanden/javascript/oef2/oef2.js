function wijzig1() {
  let oef1 = document.getElementById("two");

  oef1.textContent = "lasagne";
  oef1.style.border = "1px solid red";
  return oef1;
}

wijzig1();

function wijzig2() {
  let oef2 = document.getElementsByClassName("hot");
  let nieuweClass = "cold";
  let eersteItem = oef2[0];
  eersteItem.classList.replace("hot", "cold");
}

wijzig2();
