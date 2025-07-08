import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="random-delay"
export default class extends Controller {
  static targets = ["image"]

  connect() {
    this.applyRandomDelays()
  }

  applyRandomDelays() {
    this.imageTargets.forEach((image) => {
      const randomDelay = Math.random() * 2 // entre 0 et 5 secondes
      image.style.opacity = 0 // invisible au départ
      image.style.animationDelay = `${randomDelay}s`

      // Déclenche une animation CSS (ex: fade-in)
      image.classList.add("fade-in")

      // Rendre visible au moment de l'animation
      setTimeout(() => {
        image.style.opacity = 1
      }, randomDelay * 1000)
    })
  }
}
