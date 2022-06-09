import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="doc-highlight"
export default class extends Controller {
  static targets = ["doc"]

  setActive(event) {
    const documents = JSON.parse(event.currentTarget.dataset.documents);
    this.docTargets.forEach(docTarget => docTarget.classList.add('d-none'));
    documents.forEach(doc => {
      const d = this.docTargets.find(docTarget => docTarget.dataset.docName == doc);
      if (d) d.classList.remove("d-none");
    })
  }

  showAll(event) {
    event.preventDefault()
    this.docTargets.forEach(docTarget => docTarget.classList.remove('d-none'));
  }
}
