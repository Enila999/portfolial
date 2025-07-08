import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.animate()
  }

  animate() {
    const delay = 100
    const delayStart = 300
    const text = this.element.textContent.trim()
    this.element.textContent = ""
    this.element.style.visibility = "visible"

    text.split("").forEach((letter, index) => {
      setTimeout(() => {
        this.element.textContent += letter
      }, delayStart + delay * index)
    })
  }
}
