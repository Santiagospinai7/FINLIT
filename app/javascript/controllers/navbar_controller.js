import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["dashboard", "accounts", "savings", "home", "learningMaterial", "suggestion"]

  connect() {
    const currentUrl = window.location.pathname;
    const links = this.element.querySelectorAll('a');

    links.forEach((link) => {
      const linkUrl = link.getAttribute('href');
      if (currentUrl.length > 1) {
        if (currentUrl.includes(linkUrl) && linkUrl != "/") {
          link.classList.add('nav-buttons-active');
        } else {
          link.classList.remove('nav-buttons-active');
        }
      } else {
        if (currentUrl === linkUrl) {
          link.classList.add('nav-buttons-active');
        } else {
          link.classList.remove('nav-buttons-active');
        }
      }
    });
  }
}
