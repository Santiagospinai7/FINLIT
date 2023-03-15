import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["dashboard", "accounts", "savings", "learning", "suggestion"]

  connect() {
    const currentUrl = window.location.pathname;
    const links = this.element.querySelectorAll('a');

    links.forEach((link) => {
      const linkUrl = link.getAttribute('href');
      if (currentUrl.includes(linkUrl)) {
        link.classList.add('nav-buttons-active');
      } else {
        link.classList.remove('nav-buttons-active');
      }
    });
  }
}
