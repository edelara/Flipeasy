import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "task"]
  static values = { step: String }

  connect() {
    this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content")
  }

  update(event) {
    // event.preventDefault()
    const url = event.currentTarget.action
    const input = event.currentTarget
    let checked_inputs_count = 0
    fetch(url, {
      method: "PATCH",
      headers: { "Accept": "text/plain", "X-CSRF-Token": this.csrfToken },
      body: new FormData(event.currentTarget)
    })
      .then(response => response.text())
      .then((data) => {
        input.nextElementSibling.classList.toggle('disabled');
        input.outerHTML = data
        const tasks = this.taskTargets;
        tasks.forEach((input) => {
          if (input.checked === false) {
            checked_inputs_count += 1
          }
        })

        if (checked_inputs_count === 0) {
          const nav_tab = document.getElementById(`nav-${this.taskTarget.getAttribute("data-edit-tasks-step-value")}`);
          nav_tab.classList.add('is-complete')
        } else {
          const nav_tab = document.getElementById(`nav-${this.taskTarget.getAttribute("data-edit-tasks-step-value")}`);
          nav_tab.classList.remove('is-complete')
        }
      })

  }
}
