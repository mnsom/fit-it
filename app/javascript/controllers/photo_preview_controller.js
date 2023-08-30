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
      e.target.submit()
    }
  }

  dragover(e) {
    e.preventDefault()

    // dragover したときに border の色を変える
    this.inputTarget.classList.add('border-primary')
  }

  dragleave(e) {
    e.preventDefault()
    this.inputTarget.classList.remove('border-primary')
  }

  drop(e) {
    e.preventDefault()
    this.inputTarget.classList.remove('border-primary')
    console.log("drop");

    const files = e.dataTransfer.files
    this.inputTarget.files = files
    this.displayPreview(e)
  }


}
