import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "title" ]

  connect() {
    fetch("https://yahoo-finance15.p.rapidapi.com/api/yahoo/ne/news", {
      method: "GET",
      headers: {
        "X-RapidAPI-Key": "25fa9bb330mshb190051fed7e987p1b93bbjsn4c577d87db38",
        "X-RapidAPI-Host": "yahoo-finance15.p.rapidapi.com"
      }
    })
      .then(response => response.json())
      .then(data => {
        console.log(data.items[0])
        // const firstNewsItem = data.items[0]
        // this.titleTarget.textContent = firstNewsItem.title
        // this.linkTarget.textContent = firstNewsItem.link
        // this.linkTarget.href = firstNewsItem.link
      })
      .catch(error => console.error(error))
  }
}
