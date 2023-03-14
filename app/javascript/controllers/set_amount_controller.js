import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="set-amount"
export default class extends Controller {
  static targets = ["switchButtons", "card", "amountInput", "buttonCreate"]
  static values = { income: Boolean }

  connect() {
    console.log(this.buttonCreateTarget)
    this.setIncome();
  }

  // Create a listener change for when the user is typping in the amount field
  //creste event list that calls below function

  setIncome() {
    this.income = true;
    console.log("Income");
    this.cardTarget.style.boxShadow = "0px 0px 57px 4px rgb(8, 148, 52)";
    // this.containerTarget.style.webkitBoxShadow = "0px 0px 57px 4px rgb(8, 148, 52)";
    // this.containerTarget.style.MozBoxShadow = "0px 0px 57px 4px rgb(8, 148, 52)";

    // this.buttonCreateTarget.style.boxShadow = "0px 0px 57px 4px rgb(8, 148, 52)";
    // remove attributes from setExpense if there
    // this.amountInputTarget.removeAttribute("max")
    // this.amountInputTarget.removeAttribute("onkeypress")
    // set attributes
    // this.amountInputTarget.setAttribute("min", "1")
    // this.amountInputTarget.setAttribute("onkeypress", "return (event.charCode !=8 && event.charCode ==0 || (event.charCode >= 48 && event.charCode <= 57))")
  }

  setExpense() {
    this.income = false;
    console.log("Expense");
    console.log(this.cardTarget);
    this.cardTarget.style.boxShadow = "0px 0px 57px 4px #f44336ba"
    // this.containerTarget.style.webkitBoxShadow = "0px 0px 57px 4px #f44336ba";
    // this.containerTarget.style.MozBoxShadow = "0px 0px 57px 4px #f44336ba";

    // this.buttonCreateTarget.style.boxShadow = "0px 0px 57px 4px #f44336ba"
    // remove attributes added from set income
    // this.amountInputTarget.removeAttribute("min")
    // this.amountInputTarget.removeAttribute("onkeypress")
    // // add attributes that do the opposite from setIncome
    // this.amountInputTarget.setAttribute("max", "0")
    // this.amountInputTarget.setAttribute("onkeypress", "return (event.charCode !=8 && event.charCode ==0 || (event.charCode >= 48 && event.charCode <= 57))")


  }

  amountChanging() {
    console.log("change");
  }

  buttonHover() {
    if (this.income) {
      this.buttonCreateTarget.style.boxShadow = "0px 0px 57px 4px rgb(8, 148, 52)";
      this.buttonCreateTarget.style.borderColor = "rgb(8, 148, 52)";
      console.log("Button hover income");
    } else {
      this.buttonCreateTarget.style.boxShadow = "0px 0px 57px 4px #f44336ba";
      this.buttonCreateTarget.style.borderColor = "#f44336ba";
      console.log("Button hover expense");
    }
  }

  buttonMouseLeft() {
    console.log("mouse left")
    this.buttonCreateTarget.style.boxShadow = "0px 0px 0px 0px #f44336ba"
    this.buttonCreateTarget.style.borderColor = "#ccc"
    // this.buttonCreateTarget.style.boxShadow = "";
  }
}
