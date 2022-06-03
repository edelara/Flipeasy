import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

export default class extends Controller {
  static targets = ["step", "people"]
  connect() {
    console.log("Hello from our first Stimulus controller")
    this.stepTargets.forEach(step => {
      Sortable.create(step  , {
        group: {name: "hello", pull: false, put: true},
        sort: false,
        ghostClass: "ghost",
        onAdd: function (event) {

          step.querySelectorAll('.team-member').forEach(person => {
            if (person != event.item) person.remove();
          })
          console.log(event);
          console.log(event.item.dataset.userId);
          console.log(step.dataset.stepId);
          console.log(document.querySelector('meta[name="csrf-token"]').getAttribute("content"))
          fetch(`/steps/${step.dataset.stepId}`, {
            method: "PATCH",
            headers: { "Accept": "application/json", "Content-Type": "application/json", "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute("content") },
            body: JSON.stringify({ user_id: event.item.dataset.userId })
          })
            .then(response => response.json())
            .then((data) => {
              console.log(data)
            })
        }
      })
    })
    Sortable.create(this.peopleTarget, {
      group: {name: "hello", pull: "clone", put: false, revertClone: true},
      sort: false
    })
  }
}
