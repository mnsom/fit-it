import { fabric } from "fabric";
import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="layout"

export default class extends Controller {
  static values = {imgUrl: String}

  connect() {
    console.log("hello from layout_controller.js")
    console.log(this.element);

    const canvas = new fabric.Canvas('canvas')

    // canvas.setBackgroundImage(this.imgUrlValue, canvas.renderAll.bind(canvas), {
    //   width: canvas.width,
    //   height: canvas.height,
    //   // Needed to position backgroundImage at 0/0
    //   originX: 'left',
    //   originY: 'top'
    // });

    const center = canvas.getCenter();
    canvas.setBackgroundImage(this.imgUrlValue, canvas.renderAll.bind(canvas), {
      scaleX:1,
      scaleY:1,
      top: center.top,
      left: center.left,
      originX: 'center',
      originY: 'center'
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

// const center = canvas.getCenter();
// const scale: 300 / Img.width;
//   this.set({
//       scaleX: scale,
//       scaleY: scale
//   });
