import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="openai"
export default class extends Controller {

  static targets = [ "container", "chat" ]

  connect() {
    console.log("Connecting to OpenAI...");
  }
}
