import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-accounts"
export default class extends Controller {
  static targets = ["form", "switch", "grid", "type", "btn"]

  connect() {
    console.log("is connected to select account js")
    // console.log(this.switchTarget)
    // console.log(this.titleTarget.innerText)
    // console.log(this.gridTarget)
    // console.log(this.btnTarget)
    this.btnTarget.hidden = true
  }

  get selectedOption() {
    console.log(this.switchTarget.value)
    return this.switchTarget.value
  }

  displayAccounts() {
    this.btnTarget.click()
    // console.log(this.typeTarget.innerText)
  }
}
