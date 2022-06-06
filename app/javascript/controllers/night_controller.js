import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["switch"]

  connect() {
    console.log("hehe")
  }

  activate() {
    console.log(event)
    document.documentElement.classList.toggle('dark');
    event.preventDefault()
  }
}




// document.addEventListener('DOMContentLoaded', function () {
//   var modeSwitch = document.querySelector('.mode-switch');

//   modeSwitch.addEventListener('click', function () {
//     document.documentElement.classList.toggle('dark');
//     modeSwitch.classList.toggle('active');
//   });
// });
