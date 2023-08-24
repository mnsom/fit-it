import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-item-card"
export default class extends Controller {
static values = {
  popup: Boolean
}

static targets=["popup", "modal"]

  connect() {
    console.log("connected")
    if (this.popupValue){
      this.popupTarget.classList.remove("d-none")
      const myModal = new bootstrap.Modal(this.modalTarget)
      // const modalToggle = document.getElementById('toggleMyModal');
      myModal.show(this.modalTarget)
    }
  }

  toggle() {
    console.log("click")
    this.popupTarget.classList.toggle("d-none")
  }
}
