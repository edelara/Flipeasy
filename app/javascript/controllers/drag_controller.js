import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

export default class extends Controller {
  static targets = ["step", "people"]
  connect() {
    console.log("Hello");
    this.stepTargets.forEach(step => {
      console.log('hi')
      Sortable.create(step  , {
        group: {name: "hello", pull: false, put: true},
        sort: false,
        ghostClass: "list-ghost",


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

      })
    })

    this.peopleTargets.forEach(person => {
      Sortable.create(person  , {
        group: {name: "hello", pull: "clone", put: false},
        forceFallback: true,


        onStart: function (event) {
          console.log(event.item)
          // event.item.querySelector("img").style.border="2px solid red"
        },
        // setData: function (dataTransfer, el) {
        //   console.log(el)
        //   el.classList.add('sortable-ghost')
        //   // event.item.querySelector("img").style.border="2px solid red"
        // },
        // onEnd: function (evt) {
        //   evt.item.classList.remove('sortable-ghost')
        //   // event.item.querySelector("img").style.border="2px solid red"
        // }
      })
      // Sortable.create(person, {
      //   group: { name: "hello", pull: "clone", put: false, revertClone: true },
      //   onStart: function (event) {
      //   },
      // })
      // person.addEventListener('dragstart', e => {
      //   console.log("hello")
      //   // console.log(e);
      //   // e.toElement.style.border = "5px dotted blue";
      //   const crt = e.currentTarget.cloneNode(true);
      //   crt.querySelector("img").style.border = "5px dotted blue";
      //   // crt.style.display = "none"
      //   document.body.appendChild(crt);
      //   e.dataTransfer.setDragImage(crt, 0,0);
      // })
    })
  }

}
