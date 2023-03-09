import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="set-amount"
export default class extends Controller {
  let expenseLabelActive = false;


  connect() {
    console.log("hello from stimulus")

  }

  // Create a listener change for when the user is typping in the amount field
  //creste event list that calls below function

  transformAmount(data) {
    if (expenseLabelActive) {
      return \+amount\
    } else {
      return \-amount\
    }
  }

  setTrue() {
    console.log("setting true");
    let expenseLabelActive = true;
    // income
    // convert the amount in positive (add a '+' before the amount input)

  }

  setFalse() {
    console.log("setting false");
    let expenseLabelActive = false;
    // expense

    // convert the amount in negative (add a '-' before the amount input)

  }

  }
