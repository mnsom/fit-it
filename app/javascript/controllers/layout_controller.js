import { fabric } from "fabric";
import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="layout"

export default class extends Controller {

  static values = {imgUrl: String, furnitures: Array, scale: Number, index: Number, id: Number}
  connect() {
    console.log("hello from layout_controller.js")
    // console.log("lau¥yout controller", this.element);
    const furnitures = this.furnituresValue
    console.log(furnitures);
    console.log(this.scaleValue);



    // FLOORPLAN IMG TO CANVAS

    const canvas = new fabric.Canvas(this.indexValue ? `canvas-${this.indexValue}` : "canvas");

    // center and add the image in the canvas
    const center = canvas.getCenter();
    canvas.setBackgroundImage(this.imgUrlValue, canvas.renderAll.bind(canvas), {

      scaleX: this.scaleValue,
      scaleY: this.scaleValue,
      top: center.top,
      left: center.left,
      originX: 'center',
      originY: 'center',
      crossOrigin: "anonymous"
    });


    // SCALER FUNCTION
    //draw a straight line for SCALER
    var drawLineMode = false;
    var startPoint = null;
    var endPoint = null;

    // Event listener for the SCALER mode button
    var drawLineModeButton = document.getElementById('drawLineModeButton');
    if (drawLineModeButton) {
      drawLineModeButton.addEventListener('click', function() {
          drawLineMode = !drawLineMode; // Toggle to enter the SCALER mode
          if (drawLineMode) {
              canvas.selection = false; // Disable icon selection while in SCALER mode
              drawLineModeButton.querySelector('p').textContent = 'Exit';
          } else {
              canvas.selection = true; // Enable icon selection when exiting SCALER mode
              drawLineModeButton.querySelector('p').textContent = 'Ruler';
          }
      });

    }

    // Function to scale the background image
    function scaleBackgroundImage(scaleFactor, id) {
      var backgroundImage = canvas.backgroundImage;
      if (backgroundImage) {
          backgroundImage.scaleX = scaleFactor;
          backgroundImage.scaleY = scaleFactor;

          canvas.renderAll();
          updateBackgroundImage(scaleFactor, id);
      }
    };

    // Function to draw a line between the start and end points
    function drawLine() {
      var line = new fabric.Line([startPoint.x, startPoint.y, endPoint.x, endPoint.y], {
          stroke: '#07A2BF',
          strokeWidth: 4,
      });

      canvas.add(line);
      canvas.renderAll();
    };

    // anything between the starpoint and enpoint is pixels, and there is the scale
    // Event listener for mouse down on the canvas
    const id = this.idValue
    canvas.on('mouse:down', function(event) {
      if (drawLineMode) {
          if (!startPoint) {
              startPoint = canvas.getPointer(event.e);
          } else if (!endPoint) {
              endPoint = canvas.getPointer(event.e);
              drawLine();
              // Create a line prompt for user to insert a number
              var scaleInput = prompt("Insert Scale (eg. 1.3)");
              if (scaleInput !== null && !isNaN(scaleInput)) {
                  var scaleFactor = parseFloat(scaleInput);
                  scaleBackgroundImage(scaleFactor, id);
              };
            startPoint = null;
            endPoint = null;
          };
          canvas.on('modified', () => {
          this.update(canvas)
        });
      };
    });

    // Save background scaled image
    function updateBackgroundImage(scaleFactor, id) {
      // change just the scale
      const form = new FormData()
      form.append("layout[scale_ratio]", scaleFactor)

      // fetch to save
      const csrfToken = document.querySelector("[name='csrf-token']").content;
      fetch(`/layouts/${id}`, {
        method: "PATCH",
        headers: { "X-CSRF-Token": csrfToken, "Accept": "text/plain" },
        body: form
      })
      .then(response => response.text())
      .then((data) => {
        console.log(data)
      });
    }


    // INSERT FURNITURE ICON

    // DISPLAY FURNITURE WITH DOUBLE CLICK
    canvas.on('mouse:down', ()=>{
      console.log("hello hello");
    const furnitureInfo = document.querySelector("#furniture-info")
    furnitureInfo.classList.add("d-none")    });
    // DISPLAY FURNITURE WITH DOUBLE CLICK

    //insert a furniture Icon into the Layout
    console.log(furnitures);

    furnitures.forEach(element => {
      fabric.Image.fromURL(element.icon_url, (img) => {
        console.log(img);
        const itemScaleX = element.width / img.width
        const itemScaleY = element.length / img.height
        console.log(element.width);

        var oImg = img.set({
                            // scaleToWidth: element.width*itemScale,
                            // scaleToHeight:  element.length*itemScale,
                            scaleX: itemScaleX / this.scaleValue,
                            scaleY: itemScaleY / this.scaleValue,
                            left: element.left == 0 ? 300 : element.left,
                            top: element.top == 0 ? 300 : element.top,
                            angle: element.rotation,
                            cacheKey: element.id,

                            });
        // oImg.set({
        //   scaleX: scale,
        //   scaleY: scale
        // });
        // console.log(element);
        console.log(oImg);
        console.log(canvas);

        canvas.add(oImg);
        oImg.on('modified',() => {
          console.log('on oImg mouseup');
          this.update(oImg)
        });

        // Object Bounding Rectangle:
        // canvas.on('after:render', function() {
        //   canvas.contextContainer.strokeStyle = '#555';

        //   canvas.forEachObject(function(obj) {
        //     var bound = obj.getBoundingRect();
        //     canvas.contextContainer.strokeRect(
        //       bound.left - 20,
        //       bound.top - 20,
        //       bound.width + 40,
        //       bound.height + 40
        //     );

        //     var isColliding = false;
        //     console.log(isColliding);

        //     canvas.forEachObject(function(anotherObj) {
        //       if (obj !== anotherObj) {
        //         var collisionBound = anotherObj.getBoundingRect();

        //         if (
        //           bound.left < collisionBound.left + collisionBound.width &&
        //           bound.left + bound.width > collisionBound.left &&
        //           bound.top < collisionBound.top + collisionBound.height &&
        //           bound.top + bound.height > collisionBound.top
        //         ) {
        //           isColliding = true
        //           console.log(isColliding);
        //         };
        //       };
        //     });

        //     if (isColliding) {
        //       obj.set('stroke', 'red')
        //     } else {
        //       obj.set('stroke', '#555')
        //     }

        //   });
        //   // canvas.requestRenderAll();
        // });

        // oImg.on('deselected', function() {
        //   canvas.contextContainer.clearRect(0, 0, canvas.width, canvas.height);
        //   canvas.requestRenderAll();
        // });
        // Object Bounding Rectangle END

        // display item information HTML
        oImg.on('mousedblclick',() => {
          console.log(oImg);
          const furnitureInfo = document.querySelector("#furniture-info")
          furnitureInfo.classList.remove("d-none")
          furnitureInfo.querySelector("img").src = `${element.detail_url}`
          furnitureInfo.querySelector("h3").textContent = `${element.title}`
          furnitureInfo.querySelector("p").textContent = `(${element.length} x ${element.width})cm`
          // furnitureInfo.querySelector("img").src = `${oImg.title}`

        });
      }, { crossOrigin: "anonymous" });
    });

    // create any element with a delete function object
    const deleteIcon = "data:image/svg+xml,%3C%3Fxml version='1.0' encoding='utf-8'%3F%3E%3C!DOCTYPE svg PUBLIC '-//W3C//DTD SVG 1.1//EN' 'http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd'%3E%3Csvg version='1.1' id='Ebene_1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' x='0px' y='0px' width='595.275px' height='595.275px' viewBox='200 215 230 470' xml:space='preserve'%3E%3Ccircle style='fill:%23F44336;' cx='299.76' cy='439.067' r='218.516'/%3E%3Cg%3E%3Crect x='267.162' y='307.978' transform='matrix(0.7071 -0.7071 0.7071 0.7071 -222.6202 340.6915)' style='fill:white;' width='65.545' height='262.18'/%3E%3Crect x='266.988' y='308.153' transform='matrix(0.7071 0.7071 -0.7071 0.7071 398.3889 -83.3116)' style='fill:white;' width='65.544' height='262.179'/%3E%3C/g%3E%3C/svg%3E";

    const img = document.createElement('img');
    img.crossOrigin = "anonymous"
    img.src = deleteIcon;

    // Settings for the Grab&Drag customization control
    fabric.Object.prototype.transparentCorners = false;
    fabric.Object.prototype.cornerColor = '#07A2BF';
    fabric.Object.prototype.cornerStyle = 'circle';
    fabric.Object.prototype.borderColor = '#07A2BF';
    fabric.Object.prototype.setControlsVisibility({
      mt: false,
      mb: false,
      ml: false,
      mr: false,
      tl: false,
      tr: false,
      br: false,
      bl: false
    });

    fabric.Object.prototype.controls.deleteControl = new fabric.Control({
      x: 0.5,
      y: -0.5,
      offsetY: 16,
      cursorStyle: 'pointer',
      mouseUpHandler: deleteObject,
      render: renderIcon,
      cornerSize: 24
    });

    // DELETE ICON FROM CANVAS

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

  // Save the current location of all icons inside the canvas
  update(oImg) {
    const csrfToken = document.querySelector("[name='csrf-token']").content
    const url = `/registered_items/${oImg.cacheKey}`
    console.log(oImg);
    const form = new FormData()

    // console.log("registered_item[rotation]", oImg.angle);
    form.append("registered_item[rotation]", oImg.angle);
    form.append("registered_item[x]", oImg.aCoords.tl.x);
    form.append("registered_item[y]", oImg.aCoords.tl.y);

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
