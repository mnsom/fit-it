import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-item-card"
export default class extends Controller {

static targets=["popup"]

  connect() {
    console.log("connected")
  }

  toggle() {
    console.log("click")
    this.popupTarget.classList.toggle("d-none")
  }
}
