function wijzig1() {
  let el1 = document.getElementById("two");
  el1.textContent = "lasagne";
  el1.style.border = "1px grey dashed";
}

function wijzig2() {
  let lijstHot = document.querySelectorAll(".hot");
  let firstElement = lijstHot[0];
  firstElement.classList.replace("hot", "cold");
}

wijzig1();

wijzig2();
