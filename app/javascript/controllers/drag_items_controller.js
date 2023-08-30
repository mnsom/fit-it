import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="drag-items"
export default class extends Controller {
  static targets = ["icon"];
  connect() {
    console.log("connected:)");
  }

  drag(clickEvent) {
    const originalIcon = clickEvent.currentTarget;
    const iconClone = clickEvent.currentTarget.cloneNode(true);
    iconClone.style.position = "fixed";
    document.body.appendChild(iconClone);
    document.body.addEventListener("mousemove", (event) => {
      console.log("overing!", iconClone, event.clientY);
      iconClone.style.height = "60px";
      iconClone.style.top = `${event.clientY}px`;
      iconClone.style.left = `${event.clientX}px`;
      iconClone.style.transform = "translate(-50%, -50%)";
    });
    setTimeout(() => {
      document.body.addEventListener(
        "click",
        (event) => {
          iconClone.remove();
          const csrfToken = document.querySelector(
            "[name='csrf-token']"
          ).content;
          const form = new FormData();

          // console.log("registered_item[rotation]", oImg.angle);
          console.log(originalIcon);
          form.append("registered_item[rotation]", 0);
          form.append("registered_item[x]", 30);
          form.append("registered_item[y]", 30);
          form.append("item_id", originalIcon.dataset.itemId);

          fetch(window.location.pathname.replace("edit", "registered_items"), {
            method: "POST",
            headers: { "X-CSRF-Token": csrfToken },
            body: form,
          });
        },
        100
      );
    });
  }
}
