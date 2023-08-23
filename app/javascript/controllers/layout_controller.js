import { fabric } from "fabric";
import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="layout"

//Testing vanilla canvas, DELETE later.
// var canvas = document.querySelector('canvas')
// canvas.width = window.innerWidth;
// canvas.height = window.innerHeight;

// var c = canvas.getContext('2d');
// c.fillRect(100, 100, 100, 100)
// c.fillRect(300, 200, 200, 200)

// console.log(canvas);



export default class extends Controller {
  static values = {imgUrl: String}

  connect() {
    console.log("hello from layout_controller.js")
    console.log(this.element);

    const canvas = new fabric.Canvas('canvas')

    canvas.setBackgroundImage(this.imgUrlValue, canvas.renderAll.bind(canvas), {
      width: canvas.width,
      height: canvas.height,
      // Needed to position backgroundImage at 0/0
      originX: 'left',
      originY: 'top'
    });

    const rect = new fabric.Rect({
      top : 100,
      left : 100,
      width : 60,
      height : 70,
      fill : 'red'
    })
    canvas.add(rect)
  }
}


// export default class extends Controller {
//   static values = {imgUrl: String}
//   connect() {
//     this.context = this.element.getContext('2d');
//     console.log("hello from layout_controller.js");
//     this.#makeBase();
//   }

//   #makeBase() {
//     console.log("hello makebase");
//     console.log(this.imgUrlValue);
//     const baseImage = new Image();
//     baseImage.src = this.imgUrlValue;
//     baseImage.onload = function(){
//       this.context.drawImage(baseImage, 0, 0);
//     }
//     // baseImage.onload = () => {
//     //   this.context.drawImage(baseImage, 0, 0);
//     // };
//   }
// }
