import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["switch"]

  connect() {
  }

  activate() {
    document.documentElement.classList.toggle('dark');
  }
}




// document.addEventListener('DOMContentLoaded', function () {
//   var modeSwitch = document.querySelector('.mode-switch');

//   modeSwitch.addEventListener('click', function () {
//     document.documentElement.classList.toggle('dark');
//     modeSwitch.classList.toggle('active');
//   });
// });
