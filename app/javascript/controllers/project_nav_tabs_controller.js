import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="project-nav-tabs"
export default class extends Controller {
  static targets = [ 'tab', 'tabBtn' ]
  connect() {
  }
  navigate(event) {
    const clickedTabBtn = event.currentTarget
    const tabId = clickedTabBtn.id

    const tab = this.tabTargets.find(element => element.id == tabId)

    this.tabTargets.forEach(e => e.classList.remove('show', 'active'))
    tab.classList.add('show', 'active')

    this.tabBtnTargets.forEach(e => e.classList.remove('is-active'))
    clickedTabBtn.classList.add('is-active')
  }
}
