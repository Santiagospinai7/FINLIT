import { Controller } from "@hotwired/stimulus"
require('dotenv').config();

export default class extends Controller {
  static targets = [ "image" ]

  connect() {
      console.log("REEEEEEE!");
      this.imageTarget = this.imageTarget || this.targets.find("image");
      const accessKey = process.env.UNSPLASH_ACCESS_KEY;
      const apiUrl = 'https://api.unsplash.com/photos/random?query=finance';
      fetch(apiUrl, {
        headers: {
          'Accept-Version': 'v1',
          Authorization: `Client-ID ${accessKey}`,
        },
      })
      .then(response => response.json())
      .then(data => {
        console.log(data.urls.regular);
        this.imageTarget.src = data.urls.regular;
      })
        .catch(error => console.error(error));
    }

  refresh() {
    console.log("click");
    const accessKey = process.env.UNSPLASH_ACCESS_KEY;
    const apiUrl = 'https://api.unsplash.com/photos/random?query=finance';
    fetch(apiUrl, {
      headers: {
        'Accept-Version': 'v1',
        Authorization: `Client-ID ${accessKey}`,
      },
    })
    .then(response => response.json())
    .then(data => {
      this.imageTarget.src = data.urls.regular;
    })
    .catch(error => console.error(error));
  }
}
