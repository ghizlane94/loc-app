import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reservation"
export default class extends Controller {
  static targets = ["firstDiv", "divReservation", "buttonResa"]
  connect() {
    console.log("iam reservation")
  }
  resa(){
    this.firstDivTarget.style.opacity="0.1";
    this.buttonResaTarget.style.opacity="0.1";
    this.divReservationTarget.style.display='';

    window.scrollTo({
      top: 0,
      behavior: 'smooth'
    });
  }
  back(){
    this.firstDivTarget.style.opacity="";
    this.buttonResaTarget.style.opacity="";
    this.divReservationTarget.style.display='none';

  }
}
