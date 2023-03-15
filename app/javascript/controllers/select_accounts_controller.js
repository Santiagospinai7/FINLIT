import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-accounts"
export default class extends Controller {
  static targets = ["form", "switch", "grid", "type", "btn"]

  connect() {
    this.btnTarget.hidden = true
  }

  get selectedOption() {
    console.log(this.switchTarget.value)
    return this.switchTarget.value
  }

  displayAccounts() {
    this.btnTarget.click()
  }
}
