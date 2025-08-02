const formatText = () => {
  const input = document.getElementById("inputText").value;

  const tweetFormatter = (text) => text.slice(0, 200);
  const postFormatter = (text) => text.toUpperCase();
  const comboformatter = (text) => `${text.slice(0, 100)}... #trending`;

  document.getElementById("tweetOutput").innerText = tweetFormatter(input);
  document.getElementById("postOutput").innerText = postFormatter(input);
  document.getElementById("comboOutput").innerText = comboformatter(input);
};
