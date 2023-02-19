import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="search-form"
export default class extends Controller {
    static targets = ["form"];

    search(e) {
        if (e.keyCode === 13) {
            this.formTarget.requestSubmit();
        } else return;
    }
}
