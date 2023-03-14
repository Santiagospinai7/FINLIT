import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "title", "link", "source"]
  static values = {
    key: String
  }

  connect() {
    console.log(this.keyValue);
    const accessKey = this.keyValue;
    console.log("SUCCESS ~CONNECTED~");
    fetch("https://yahoo-finance15.p.rapidapi.com/api/yahoo/ne/news", {
      method: "GET",
      headers: {
        "X-RapidAPI-Key": accessKey,
        "X-RapidAPI-Host": "yahoo-finance15.p.rapidapi.com"
      }
    })
      .then(response => response.json())
      .then(data => {
        this.dataVar = data;
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
    const shuffledData = this.shuffle(this.dataVar); // shuffle the data array
    const randomIndex = Math.floor(Math.random() * shuffledData.length);
    const randomNewsItem = shuffledData[randomIndex];
    console.log("SHuffle data", randomNewsItem)
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
