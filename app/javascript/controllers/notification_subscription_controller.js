import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { userId: Number }
  static targets = ["container"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "NotificationChannel", id: this.userIdValue },
      { received: data => {
        console.log(data);
        this.containerTarget.innerHTML = data;
        this.containerTarget.style.display = 'block';
        new Audio('https://res.cloudinary.com/dsc1uchot/video/upload/v1654692016/ZURQ2FE-notification_qr4zy7.mp3').play();
        setTimeout(() => this.containerTarget.style.display = 'none', 5000)
      } }
    )
    // console.log(`Subscribed to the user with the id ${this.userIdValue}.`)
  }


  disconnect() {
    // console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
