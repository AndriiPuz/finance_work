import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="hide"
export default class extends Controller {
    static targets = ["button"];

    hideBtn() {
        this.buttonTarget.hidden = true;
    }

    showBtn() {
        this.buttonTarget.hidden = false;
    }
}
