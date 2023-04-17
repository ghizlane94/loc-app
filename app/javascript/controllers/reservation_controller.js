import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reservation"
export default class extends Controller {
  static targets = ["firstDiv", "divReservation"]
  connect() {
    console.log("iam reservation")
  }
  resa(){
    this.firstDivTarget.style.opacity="0.1";
    this.divReservationTarget.style.display='';
    window.scrollTo({
      top: 0,
      behavior: 'smooth'
    });
  }
}


