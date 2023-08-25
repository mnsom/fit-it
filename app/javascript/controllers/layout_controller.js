import { fabric } from "fabric";
import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="layout"

export default class extends Controller {
  static values = {imgUrl: String, furnitures: String}
  connect() {
    console.log("hello from layout_controller.js")
    console.log(this.element);
    const furnitures = JSON.parse(this.furnituresValue)
    console.log(furnitures);

    const canvas = new fabric.Canvas('canvas')

    const center = canvas.getCenter();
    canvas.setBackgroundImage(this.imgUrlValue, canvas.renderAll.bind(canvas), {
      scaleX:1,
      scaleY:1,
      top: center.top,
      left: center.left,
      originX: 'center',
      originY: 'center'
    });


    //insert a furniture Icon into the Layout
    furnitures.forEach(element => {
      fabric.Image.fromURL(element.url+".jpg", (img) => {
        var oImg = img.set({ left: element.left, top: element.top, cacheKey: element.id }).scale(0.25);
        // console.log(oImg);
        canvas.add(oImg);
        oImg.on('modified',() => {
          console.log('on oImg mouseup');
          this.update(oImg)
        });
      });
    });

    // create any element with a delete function object
    const deleteIcon = "data:image/svg+xml,%3C%3Fxml version='1.0' encoding='utf-8'%3F%3E%3C!DOCTYPE svg PUBLIC '-//W3C//DTD SVG 1.1//EN' 'http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd'%3E%3Csvg version='1.1' id='Ebene_1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' x='0px' y='0px' width='595.275px' height='595.275px' viewBox='200 215 230 470' xml:space='preserve'%3E%3Ccircle style='fill:%23F44336;' cx='299.76' cy='439.067' r='218.516'/%3E%3Cg%3E%3Crect x='267.162' y='307.978' transform='matrix(0.7071 -0.7071 0.7071 0.7071 -222.6202 340.6915)' style='fill:white;' width='65.545' height='262.18'/%3E%3Crect x='266.988' y='308.153' transform='matrix(0.7071 0.7071 -0.7071 0.7071 398.3889 -83.3116)' style='fill:white;' width='65.544' height='262.179'/%3E%3C/g%3E%3C/svg%3E";

    const img = document.createElement('img');
    img.src = deleteIcon;

    // Settings for the customization thingymaggi
    fabric.Object.prototype.transparentCorners = false;
    fabric.Object.prototype.cornerColor = 'blue';
    fabric.Object.prototype.cornerStyle = 'circle';

    fabric.Object.prototype.controls.deleteControl = new fabric.Control({
      x: 0.5,
      y: -0.5,
      offsetY: 16,
      cursorStyle: 'pointer',
      mouseUpHandler: deleteObject,
      render: renderIcon,
      cornerSize: 24
    });

    // Add();

    function deleteObject(eventData, transform) {
      const target = transform.target;
      console.log(target.cacheKey);
      const canvas = target.canvas;
      canvas.remove(target);
      canvas.requestRenderAll();
      const csrfToken = document.querySelector("[name='csrf-token']").content
      fetch(`/registered_items/${target.cacheKey}`, {
        method: "DELETE",
        headers: { "X-CSRF-Token": csrfToken }
      })
    }

    function renderIcon(ctx, left, top, styleOverride, fabricObject) {
      const size = this.cornerSize;
      ctx.save();
      ctx.translate(left, top);
      ctx.rotate(fabric.util.degreesToRadians(fabricObject.angle));
      ctx.drawImage(img, -size/2, -size/2, size, size);
      ctx.restore();
    }

    // canvas.on('mouse:up', (options)=>{
    //   // console.log('on canvas mousedown', options.target ? options.target.type : '');
    //   this.update()
    // });
    //1 select the element
    // canvas.on('mouse:dblclick', (options)=>{
    //   //2 listen to the event
    //   // console.log('on canvas mouse dblclick', options.target ? options.target.type : '');
    // });

  }

  update(oImg) {
    const csrfToken = document.querySelector("[name='csrf-token']").content
    const url = `/registered_items/${oImg.cacheKey}`
    console.log(oImg);
    const form = new FormData()

    form.append("registered_item[x]", oImg.aCoords.tl.x)
    form.append("registered_item[y]", oImg.aCoords.tl.y)
    fetch(url, {
      method: "PATCH",
      headers: { "X-CSRF-Token": csrfToken, "Accept": "text/plain" },
      body: form
    })
      .then(response => response.text())
      .then((data) => {
        // console.log(data)
      });
    // console.log('hello from update');
    // console.log(oImg);
  }
}
