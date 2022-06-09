import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="document"
export default class extends Controller {
  static targets = ["status", "btn"]
  static values = { docId: Number }

  connect() {
    this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content")
  }

  changeStatus(){
    const newStatus = event.currentTarget.dataset.newStatus;

    this.statusTarget.innerHTML = "Done"
    fetch(`/documents/${this.docIdValue}/change_status`, {
      method: "PATCH",
      headers: { "Accept": "application/json", "Content-Type": "application/json", "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute("content") },
      body: JSON.stringify({ status: newStatus })
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data.document_row)
        document.getElementById(`doc-${this.docIdValue}`).outerHTML = data.document_row;
      })
  }
}
