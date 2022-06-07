import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "task"]

  connect() {
    console.log("Hello ça marche!")
    this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content")
  }

  update(event) {
    // event.preventDefault()
    const url = event.currentTarget.action
    const input = event.currentTarget
    fetch(url, {
      method: "PATCH",
      headers: { "Accept": "text/plain", "X-CSRF-Token": this.csrfToken },
      body: new FormData(event.currentTarget)
    })
      .then(response => response.text())
      .then((data) => {
        input.nextElementSibling.classList.toggle('disabled');
        input.outerHTML = data
      })

    //////////// style ////////////
    // if this.taskTarget.
    //   this.taskTarget.classList.remove('active')
  }
}
