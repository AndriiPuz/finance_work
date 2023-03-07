import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="flash-messages"
export default class extends Controller {
    static targets = ["flash"];

    connect() {
      this.flashTarget.classList.add("hiden");
      setTimeout(() => {
        this.flashTarget.style.display = "none";
      }, 2000);
    }

}
