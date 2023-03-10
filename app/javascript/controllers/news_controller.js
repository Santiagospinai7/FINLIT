import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "title", "link", "source"]
  data = [];

  connect() {
    console.log("Hello from Stimulus!", this.linkTarget);
    fetch("https://yahoo-finance15.p.rapidapi.com/api/yahoo/ne/news", {
      method: "GET",
      headers: {
        "X-RapidAPI-Key": "25fa9bb330mshb190051fed7e987p1b93bbjsn4c577d87db38",
        "X-RapidAPI-Host": "yahoo-finance15.p.rapidapi.com"
      }
    })
      .then(response => response.json())
      .then(data => {
        this.data = data;
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
    // Fisher-Yates shuffle algorithm
    for (let i = array.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [array[i], array[j]] = [array[j], array[i]];
    }
    return array;
  }

}
