import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

export default class extends Controller {
  static targets = ["step", "people"]
  connect() {
    this.stepTargets.forEach(step => {
      Sortable.create(step  , {
        group: {name: "hello", pull: false, put: true},
        sort: false,
        ghostClass: "ghost",

        onAdd: function (event) {
          step.querySelectorAll('img').forEach(person => {
            if (person != event.item) person.remove();
          })
          fetch(`/steps/${step.dataset.stepId}`, {
            method: "PATCH",
            headers: { "Accept": "application/json", "Content-Type": "application/json", "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute("content") },
            body: JSON.stringify({ user_id: event.from.dataset.userId })
          })
            .then(response => response.json())
            .then((data) => {
            })
        },

        onMove: function (event) {
          return -1

        }
      })
    })

    this.peopleTargets.forEach(person => {
      Sortable.create(person  , {
        group: {name: "hello", pull: "clone", put: false}
      })
      // Sortable.create(person, {
      //   group: { name: "hello", pull: "clone", put: false, revertClone: true },
      //   onStart: function (event) {
      //   },
      // })
    })
  }

}
