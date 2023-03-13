import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="set-amount"
export default class extends Controller {
  static targets = ["income-label", "expense-label", "amountInput"]


  connect() {
    this.setIncome();
  }

  // Create a listener change for when the user is typping in the amount field
  //creste event list that calls below function

  setIncome() {
    console.log("Income");
    // remove attributes from setExpense if there
    this.amountInputTarget.removeAttribute("max")
    this.amountInputTarget.removeAttribute("onkeypress")
    // set attributes
    this.amountInputTarget.setAttribute("min", "1")
    this.amountInputTarget.setAttribute("onkeypress", "return (event.charCode !=8 && event.charCode ==0 || (event.charCode >= 48 && event.charCode <= 57))")
  }

  setExpense() {
    console.log("Expense");
    // remove attributes added from set income
    this.amountInputTarget.removeAttribute("min")
    this.amountInputTarget.removeAttribute("onkeypress")
    // add attributes that do the opposite from setIncome
    this.amountInputTarget.setAttribute("max", "0")
    // this.amountInputTarget.setAttribute("onkeypress", "return (event.charCode !=8 && event.charCode ==0 || (event.charCode >= 48 && event.charCode <= 57))")


  }

  amountChanging() {
    console.log("change");
  }
}
