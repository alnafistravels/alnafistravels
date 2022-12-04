import {Controller} from "@hotwired/stimulus"

// Connects to data-controller="staff"
export default class extends Controller {
    static targets = ['message', 'billing', 'iframe', 'details']

    connect() {
        console.log("connected")

    }

    click(event) {
        const url = event.target.dataset.url
        this.iframeTarget.setAttribute("src", url)
    }

    open(event) {
        const id = event.target.dataset.blogId;
        if (event.target.classList.contains('active')) {
            event.target.classList.remove('active')
            $("#"+id).slideToggle();
        } else {
            event.target.classList.add('active')
            $("#"+id).slideToggle();
        }
    }
}
