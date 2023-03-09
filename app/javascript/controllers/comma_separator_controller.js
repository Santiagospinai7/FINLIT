import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comma-separator"
export default class extends Controller {
  connect() {
    console.log("hello from stimulus")
  }
}
