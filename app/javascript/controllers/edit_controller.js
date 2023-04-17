import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit"
export default class extends Controller {
  static targets = ["form"]
  connect() {
    console.log("edit")
  }
  display(){
  console.log("iam clicked")
  this.formTarget.classList.remove("d-none");
  }

}



