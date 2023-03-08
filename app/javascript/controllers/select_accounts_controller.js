import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-accounts"
export default class extends Controller {
  static targets = ["switch", "title", "grid", "type"]

  connect() {
    console.log("is connected to select account js")
    console.log(this.switchTarget)
    console.log(this.titleTarget.innerHTML)
    console.log(this.gridTarget)
    
  }

  get selectedOption() {
    return this.switchTarget.value
  }

  displayAccounts() {
    this.titleTarget.innerHTML = this.selectedOption
    console.log(this.typeTarget.innerText)
  }
}
