import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="photo-preview"
export default class extends Controller {
  connect() {
    console.log("connected!");
  }

  static targets = ["input", "preview", "name", ""]

  displayPreview(event) {
    const reader = new FileReader();
    reader.onload = (event) => {
      this.previewTarget.src = event.currentTarget.result;
    }
    reader.readAsDataURL(this.inputTarget.files[0])
    this.previewTarget.classList.remove('hidden');
  }

  uploadPhoto() {
    this.inputTarget.click();
  }

  validate(e) {
    e.preventDefault();
    if (this.nameTarget.value == "") {
      alert("missing title")
    } else {
      e.submit()
    }
  }
}
