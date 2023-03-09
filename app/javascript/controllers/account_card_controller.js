import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="account-card"
export default class extends Controller {
  static targets = ["form", "input", "goalField", "accountNumber"]

  connect() {
    console.log("connect")
    // console.log(this.formTarget)
    console.log(this.inputTarget.innerHTML)
    // console.log(this.goalFieldTarget)
    this.goalFieldTarget.hidden = true
    this.accountNumberTarget.hidden = true
  }

  accountType() {
    console.log(this.inputTarget.value)
    this.goalFieldTarget.hidden = (this.inputTarget.value == "Savings") ? false : true
    this.accountNumberTarget.hidden = (this.inputTarget.value != "Savings") ? false : true
  }
}
