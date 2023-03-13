import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "title", "link", "source"]
  data = [];

  connect() {
    console.log("Searching for News!");
    const rapidKey = process.env.RAPID_ACCESS_KEY;
    console.log(rapidKey);
    fetch("https://yahoo-finance15.p.rapidapi.com/api/yahoo/ne/news", {
      method: "GET",
      headers: {
        "X-RapidAPI-Key": rapidKey,
        "X-RapidAPI-Host": "yahoo-finance15.p.rapidapi.com"
      }
    })
      .then(response => response.json())
      .then(data => {
        this.data = data;
        console.log("Finding Data...")
        const firstNewsItem = data[0];
        const firstNewsLink = data[0].link;
        const firstNewsSource = data[0].source;
        this.sourceTarget.innerText = firstNewsSource;
        this.titleTarget.innerText = firstNewsItem.title;
        this.linkTarget.href = firstNewsLink;
      })

    .catch(error => console.error(error));
  }

  refresh() {
    console.log("click");
    const shuffledData = this.shuffle(this.data); // shuffle the data array
    const randomIndex = Math.floor(Math.random() * shuffledData.length);
    const randomNewsItem = shuffledData[randomIndex];
    const randomNewsLink = randomNewsItem.link;
    const randomNewsSource = randomNewsItem.source;
    this.titleTarget.innerText = randomNewsItem.title;
    this.linkTarget.href = randomNewsLink;
    this.sourceTarget.innerText = randomNewsSource;
  }

  shuffle(array) {
    for (let i = array.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [array[i], array[j]] = [array[j], array[i]];
    }
    return array;
  }
}
