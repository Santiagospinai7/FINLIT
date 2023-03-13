import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "image" ]

  connect() {
      console.log("REEEEEEE!");
      this.imageTarget = this.imageTarget || this.targets.find("image");
      const accessKey = "FboSVqbKlq0wIqv_ySxZklvUI6C6yqj0ooTP4gh9Ugg";
      const apiUrl = '';
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
    const accessKey = "FboSVqbKlq0wIqv_ySxZklvUI6C6yqj0ooTP4gh9Ugg";
    const apiUrl = '';
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
