import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["index", "gridbutton", "listbutton"]

  connect() {
  }

  grid() {
    this.gridbuttonTarget.classList.add('active')
    this.listbuttonTarget.classList.remove('active')

    this.indexTarget.classList.add('jsGridView')
    this.indexTarget.classList.remove('jsListView')
  }

  list() {
    this.gridbuttonTarget.classList.remove('active')
    this.listbuttonTarget.classList.add('active')

    this.indexTarget.classList.add('jsListView')
    this.indexTarget.classList.remove('jsGridView')
  }
}
