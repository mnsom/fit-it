import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="layout"
export default class extends Controller {
  static value = {imgUrl: String}
  connect() {
    this.context = this.element.getContext('2d');
    console.log("hello from layout_controller.js");
    this.#makeBase();
  }

  #makeBase() {
    console.log(this.imgUrlValue);
    const baseImage = new Image();
    baseImage.src = this.imgUrlValue;
    baseImage.onload = function(){
      this.context.drawImage(baseImage, 0, 0);
    }
    // baseImage.onload = () => {
    //   this.context.drawImage(baseImage, 0, 0);
    // };
  }
}
