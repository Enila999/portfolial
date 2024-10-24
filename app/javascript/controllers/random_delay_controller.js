import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="random-delay"
export default class extends Controller {
  static targets = ["image"]

  connect() {
    window.addEventListener('load', () => {
      this.applyRandomDelays(); // Appeller la fonction lorsque la page est chargée
    });
  }

  applyRandomDelays() {
    this.imageTargets.forEach((image) => {
      const randomDelay = Math.random() * 5; // Génère un délai aléatoire entre 0 et 5 secondes
      image.style.animationDelay = `${randomDelay}s`; // Applique le délai d'animation
      image.style.opacity = 1; // Rendre l'image visible lorsque l'animation commence
    });
  }

}
