import { Controller } from "@hotwired/stimulus"
import { jsPDF } from "jspdf";

// Connects to data-controller="download-button"
export default class extends Controller {
  static targets = ["canvas"]
  connect() {
    // console.log(jsPDF)
  }
  // step1 data-action を html　につける
  // step2 methodの中身をつくる linkをみてるつける
  download() {
    const imgData = this.canvasTarget.toDataURL("image/jpeg", 1.0);
    const pdf = new jsPDF();

    pdf.addImage(imgData, 'JPEG', 0, 0);
    pdf.save("download.pdf");
  }
}
