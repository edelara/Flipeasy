import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="notification-box"
export default class extends Controller {
  static targets = ["notification"]

  connect() {
    console.log("hola")
  }

  close() {
    this.notificationTarget.style.display = 'none';
  }
}
