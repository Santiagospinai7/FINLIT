import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="account-card"
export default class extends Controller {
  static targets = ["form", "iconButton", "iconsInput"]

  connect() {
    console.log("connect");
    console.log(this.formTarget);
    // console.log(this.iconButtonTarget);
    console.log(this.iconsInputTarget);

    // this.iconsInputTarget.hidden = true;
  }

  changeIcon() {
    console.log("button clicked")
  }
}
