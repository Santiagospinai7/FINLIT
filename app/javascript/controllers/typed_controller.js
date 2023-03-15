import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "text" ];

  connect() {
    let i = 0;
    let text = "Hi, I'm BudgetBot!";
    let speed = 50;

    const outputTarget = this.textTarget;
    const cursorTarget = this.element.querySelector("#cursor");

    function typeWriter() {
      if (i < text.length) {
        outputTarget.textContent += text.charAt(i);
        i++;
        setTimeout(typeWriter, speed);
      } else {
        cursorTarget.style.display = "none";
      }
    }

    typeWriter();
  }
}
