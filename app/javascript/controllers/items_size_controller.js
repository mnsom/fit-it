import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="items-size"
export default class extends Controller {
  static values = {dimensions: Array}

  connect() {
    console.log(this.dimensionsValue);
    const itemScaleX = this.dimensionsValue[0] / this.element.width
    const itemScaleY = this.dimensionsValue[1] / this.element.height

    this.element.style.transform = `scale(${itemScaleX}, ${itemScaleY})`
  }
}
