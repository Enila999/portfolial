// app/javascript/controllers/lightbox_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "image"]

  connect() {
    console.log("🔦 LightboxController connecté")
  }

  open(event) {
    event.preventDefault()
    console.log("▶️ open", event.currentTarget.dataset.lightboxSrcValue)
    this.imageTarget.src = event.currentTarget.dataset.lightboxSrcValue
    this.modalTarget.classList.add("visible")
  }

  close(event) {
    event.preventDefault()
    console.log("✖️ close")
    this.modalTarget.classList.remove("visible")
  }
}
