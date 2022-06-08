import { Controller } from "@hotwired/stimulus"
import confetti from 'canvas-confetti';

// Connects to data-controller="confettis"
export default class extends Controller {
  static targets = ["task"]

  connect() {
    // console.log("Des paillettes dans ma vie Kevin !")
  }

  displayConfettis() {

    let checked_inputs_count = 0
    const tasks = this.taskTargets;
    tasks.forEach((input) => {
      if (input.checked === false) {
        // console.log('un input de checké')
        checked_inputs_count += 1
      }
    })

    if (checked_inputs_count === 0) {
      const timing = setInterval(this.#launchConfettis.bind(this), 100)

      setTimeout(() => {
        clearInterval(timing)
      }, 2000);
    }
  }

  #launchConfettis() {

    confetti({
      angle: this.#randomInRange(55, 125),
      spread: this.#randomInRange(50, 70),
      particleCount: this.#randomInRange(20, 30),
      origin: { y: 0.6 }
    })
  }

  #randomInRange(min, max) {
    return Math.random() * (max - min) + min;
  }
}
