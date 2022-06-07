import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="document"
export default class extends Controller {
  static targets = ["status", "btn"]
  connect() {
    console.log("document controller");
  }

  update_done(){
    console.log("document update");
    console.log(this.btnTarget);
    this.statusTarget.innerHTML = "Done"
  }

  update_pending(){
    console.log("document update");
    console.log(this.btnTarget);
    this.statusTarget.innerHTML = "Review pending"
  }

  update_drafting(){
    console.log("document update");
    console.log(this.btnTarget);
    this.statusTarget.innerHTML = "Drafting"
  }

  update_no_draft(){
    console.log("document update");
    console.log(this.btnTarget);
    this.statusTarget.innerHTML = "No Draft"
  }
}
