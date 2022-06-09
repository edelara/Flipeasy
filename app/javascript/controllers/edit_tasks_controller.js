import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "task"]
  static values = { step: String }

  connect() {
    this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content")
  }

  update(event) {
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
      console.log(input)
      const checkBox = input.querySelector('.tasks-checkbox')
      if (checkBox.checked) this.addDate(input)
      input.nextElementSibling.classList.toggle('disabled');
      input.outerHTML = data
      const tasks = this.taskTargets;
      tasks.forEach((input) => {
        if (input.checked === false) {
          console.log('un input de checké')
          checked_inputs_count += 1
          this.removeDate(input)
        }
      })
// ======= master
//       .then(response => response.text())
//       .then((data) => {
//         input.nextElementSibling.classList.toggle('disabled');
//         input.outerHTML = data
//         const tasks = this.taskTargets;
//         tasks.forEach((input) => {
//           if (input.checked === false) {
//             checked_inputs_count += 1
//           }
//         })
// >>>>>>> master

        if (checked_inputs_count === 0) {
          const nav_tab = document.getElementById(`nav-${this.taskTarget.getAttribute("data-edit-tasks-step-value")}`);
          nav_tab.classList.add('is-complete')
        } else {
          const nav_tab = document.getElementById(`nav-${this.taskTarget.getAttribute("data-edit-tasks-step-value")}`);
          nav_tab.classList.remove('is-complete')
        }
      })

  }

  removeDate(input) {
    const date = input.closest('.task-container').querySelector('.task-end-date')
    if (date) date.remove()
  }

  addDate(input) {
    const dateWords = (new Date).toDateString().split(' ')
    const dateString = `${dateWords[1]} ${dateWords[2]}, ${dateWords[3]}`
    const dateElement = document.createElement('p')
    dateElement.classList.add('task-end-date')
    dateElement.innerHTML = `<em><small>${dateString}</small></em>`
    console.log(input.closest('.task-container'))
    input.closest('.task-container').appendChild(dateElement)
  }
}
