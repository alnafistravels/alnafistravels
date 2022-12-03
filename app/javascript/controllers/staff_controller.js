import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="staff"
export default class extends Controller {
  static targets = ['message', 'billing', 'iframe']

  connect() {
    console.log("connected")
  }

  click(event) {
    const url = event.target.dataset.url
    this.iframeTarget.setAttribute("src", url)
  }
}
