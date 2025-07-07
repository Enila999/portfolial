import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]

  connect() {
    console.log("✅ navbar_controller connecté")
  }

  toggle(event) {
    event.preventDefault()
    console.log("🟠 avatar cliqué")
    this.menuTarget.classList.toggle("show")
  }

  close(event) {
    if (!this.element.contains(event.target)) {
      this.menuTarget.classList.remove("show")
    }
  }
}
