import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "title", "link" ]
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
        this.titleTarget.innerText = firstNewsItem.title;
        this.linkTarget.href = firstNewsLink;
      })
      .catch(error => console.error(error));
  }

  refresh() {
    console.log("click");
    const randomIndex = Math.floor(Math.random() * this.data.length);
    const randomNewsItem = this.data[randomIndex];
    const randomNewsLink = randomNewsItem.link;
    this.titleTarget.innerText = randomNewsItem.title;
    this.linkTarget.href = randomNewsLink;
  }
}
