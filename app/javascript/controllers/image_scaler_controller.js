import { fabric } from "fabric"
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="image-scaler"
export default class extends Controller {
  connect() {
    console.log("hello from image_scaler_controller.js");
    console.log(this.element);

    //this where I listen to an event an add the cordinates here
    const canvas = new fabric.Canvas('canvas');
    const rect = new fabric.Rect({
      left: 10,
      top: 10,
      fill: "#FF0000",
      stroke: "#000",
      width: 50,
      height: 50,
    });
    canvas.add(rect);

    rect.on('mousedblclick', ()=>{
      console.log('on dblClick rect');
    });
    rect.on('mousedown', ()=>{
      console.log('on mousedown rect');
    });
    canvas.on('mouse:down', (options)=>{
      console.log('on canvas mousedown', options.target ? options.target.type : '');
    });
    //1 select the element
    canvas.on('mouse:dblclick', (options)=>{
      //2 listen to the event
      console.log('on canvas mouse dblclick', options.target ? options.target.type : '');
    });
    //3 change the dom

    //Yann formula goes below heres
    const scaler = canvas.scaleimg();
    function calcHypothenuse(a,b) {
      a = Math.abs(x1 - x2)
      b = Math.abs(y1 - y2)
      h = Math.sqrt(a*a - b*b)
      return h
    };
    console.log(calcHypothenuse(a,b));
  };
}
