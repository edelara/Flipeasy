import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="notification-box"
export default class extends Controller {
  static targets = ["notification"]

  connect() {
  }

  close() {
    this.notificationTarget.style.display = 'none';
  }
}
