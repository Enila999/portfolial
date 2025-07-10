import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["title", "card"]

  connect() {
    this.cards = document.querySelectorAll("[data-hover-text-target='card']")
    this.cards.forEach((card) => {
      card.addEventListener("mouseenter", this.show.bind(this))
      card.addEventListener("mouseleave", this.hide.bind(this))
    })
  }

  show(event) {
    const card = event.currentTarget
    const customer = card.dataset.customer
    this.titleTarget.textContent = customer
    this.titleTarget.style.opacity = 1
    this.titleTarget.style.transform = "scale(1)"
  }

  hide() {
    this.titleTarget.style.opacity = 0
    this.titleTarget.style.transform = "scale(0.8)"
  }
}
