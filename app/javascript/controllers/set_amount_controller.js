import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="set-amount"
export default class extends Controller {
  static targets = ["switchButtons", "card", "category", "typeInput", "amountInput", "buttonCreate"]
  static values = { 
    income: Boolean,
    incomeCategories: ['Income', 'Investments', 'Salary', 'Gift'], 
    expenseCategories: ['Food & Drinks', 'Shopping' , 'Housing', 'Transportation', 'Vehicle', 'Life & Entertainment', 'Financial expenses'] 
  }

  connect() {
    console.log("connect")
    console.log(this.amountInputTarget)
    this.typeInputTarget.hidden = true

    this.setIncome();
    this.removeOptions()
    this.updateCategories()

    // Add event listener for the change event on operation_type input field
    this.switchButtonsTarget.addEventListener("change", this.updateCategories.bind(this))
  }

  updateCategories() {
    if (this.typeInputTarget.value == "income") {
      this.removeOptions()
      this.incomeCategoriesValue.map(category => this.addOption(category))

    } else if (this.typeInputTarget.value == "expense") {
      this.removeOptions()
      this.expenseCategoriesValue.map(category => this.addOption(category))
    }
  }

  addOption(option_value) {
    const option = document.createElement("option")
    option.text = option_value
    option.value = option_value
    this.categoryTarget.add(option)
  }

  removeOptions() {
    let select = this.categoryTarget;
    for (let i = select.options.length - 1; i >= 1; i--) {
      select.remove(i);
    }
  }

  setIncome() {
    // this.categoryTarget.collection = this.incomeCategoriesValue
    this.income = true;
    this.amountChanging()

    // console.log("Income");
    this.typeInputTarget.value = "income"
    this.cardTarget.style.boxShadow = "0px 0px 57px 4px rgb(8, 148, 52)";
    // this.containerTarget.style.webkitBoxShadow = "0px 0px 57px 4px rgb(8, 148, 52)";
    // this.containerTarget.style.MozBoxShadow = "0px 0px 57px 4px rgb(8, 148, 52)";

    this.amountInputTarget.removeAttribute("max")
    this.amountInputTarget.removeAttribute("onkeypress")
    // set attributes
    this.amountInputTarget.setAttribute("min", "1")
    this.amountInputTarget.setAttribute("onkeypress", "return (event.charCode !=8 && event.charCode ==0 || (event.charCode >= 48 && event.charCode <= 57))")
  }

  setExpense() {
    // this.categoryTarget.collection = this.expenseCategoriesValue
    this.income = false;
    this.amountChanging()

    // console.log("Expense");
    this.typeInputTarget.value = "expense"
    // console.log(this.typeInputTarget.value);
    this.cardTarget.style.boxShadow = "0px 0px 57px 4px #f44336ba"
    // this.containerTarget.style.webkitBoxShadow = "0px 0px 57px 4px #f44336ba";
    // this.containerTarget.style.MozBoxShadow = "0px 0px 57px 4px #f44336ba";

    this.amountInputTarget.removeAttribute("min")
    this.amountInputTarget.removeAttribute("onkeypress")
    // // add attributes that do the opposite from setIncome
    this.amountInputTarget.setAttribute("max", "0")
    this.amountInputTarget.setAttribute("onkeypress", "return (event.charCode !=8 && event.charCode ==0 || (event.charCode >= 48 && event.charCode <= 57))")
  }

  amountChanging() {
    // const input = event.target.value
    const input = this.amountInputTarget.value

    if (!this.income) {
      const negativeRegex = /^(\d+(\.\d+)?)$/gm;
      const result = input.replace(negativeRegex, "-$1");
      this.amountInputTarget.value = result
    } else {
      const positiveRegex = /^-?(.*)$/;
      const result = input.replace(positiveRegex, "$1");

      this.amountInputTarget.value = result
    }
  }

  buttonHover() {
    if (this.income) {
      this.buttonCreateTarget.style.boxShadow = "0px 0px 57px 4px rgb(8, 148, 52)";
      this.buttonCreateTarget.style.border = "2px solid green";
    } else {
      this.buttonCreateTarget.style.boxShadow = "0px 0px 57px 4px #f44336ba";
      this.buttonCreateTarget.style.border = "2px solid red";
    }
  }

  buttonMouseLeft() {
    this.buttonCreateTarget.style.boxShadow = "0px 0px 0px 0px #f44336ba"
    this.buttonCreateTarget.style.borderColor = "#ccc"
    // this.buttonCreateTarget.style.boxShadow = "";
  }
}
