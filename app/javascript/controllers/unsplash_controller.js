import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "image" ]
  static values = {
    key: String
  }

  connect() {
    console.log("UNSPLASH - KEY", this.keyValue);
    const imageTarget = this.imageTarget || this.targets.find("image");
    const accessKey = this.keyValue;
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
      imageTarget.src = data.urls.regular;
    })
    .catch(error => console.error(error));
  }

  refresh() {
    console.log("click");
    const accessKey = this.keyValue;
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
