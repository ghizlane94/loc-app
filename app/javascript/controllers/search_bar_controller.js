import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["box", "searchBtn", "cancelBtn"]
  connect() {
    console.log("Hello from our first Stimulus controller")
  }
  search(){
    console.log("hello")
    this.BoxTarget.classList.add("active");
    this.cancelBtnTarget.style.visibility="visible";
  }
  cancel(){
    this.BoxTarget.classList.remove("active");
    this.cancelBtnTarget.style.visibility="hidden";
  }
}
// document.addEventListener("DOMContentLoaded", () => {
//   const searchBtnNew=document.querySelector(".search-btn");
//   const searchBox =document.querySelector(".search-box");
//   const cancelBtn = document.querySelector(".cancel-btn");
//   searchBtnNew.onclick =() => {
//     searchBox.classList.add("active");
//     cancelBtn.style.visibility="visible";
//   }
//   cancelBtn.onclick =() => {
//     searchBox.classList.remove("active");
//     cancelBtn.style.visibility="hidden";
//   }
// })
