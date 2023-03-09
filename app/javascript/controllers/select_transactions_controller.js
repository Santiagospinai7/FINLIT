import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-transactions"
export default class extends Controller {
  static targets = ["categories"]

  connect() {
    console.log("hello from select transaction")
    this.goalFieldTarget.hidden = true
  }

  listenToSelection() {
    console.log(this.categoriesTarget.value)
    // if statement.
    // add different fields depending on selected value
    this.categoriesTarget.hidden = (this.inputTarget.value == "Groceries") ? false : true
  }
}
