import { Controller } from "@hotwired/stimulus"
import { jsPDF } from "jspdf";

// Connects to data-controller="download-edit"
export default class extends Controller {
  static targets = ["canvas"]
  connect() {
  }

  download() {
    console.log("hello from download", this.canvasTarget)
    const imgData = this.canvasTarget.toDataURL("image/jpeg", 1.0);
    const pdf = new jsPDF();

    pdf.addImage(imgData, 'JPEG', 30, 73.5, 150, 150);
    // pdf.text("helllo", 10,10)
    pdf.save("download.pdf");
  }
}
