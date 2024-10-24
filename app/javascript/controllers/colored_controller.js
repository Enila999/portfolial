import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="colored"
export default class extends Controller {
  static targets = ["colored"]


  connect() {
    this.coloredHeader = this.coloredTarget;
    this.originalDimensions = this.coloredHeader.getBoundingClientRect();
    this.width = this.coloredHeader.offsetWidth;
    this.coloredHeader.style.backgroundColor = 'rgba(203, 188, 160, 0)';
    this.onScrollRunning = false
    window.addEventListener('resize', this.updateDimensions.bind(this)); // Écouteur pour resize
  }

  updateDimensions() {
      this.width = this.coloredHeader.offsetWidth; // Recalculer la largeur
  }

  onScroll(event) {
    if (!this.onScrollRunning) {
      this.onScrollRunning = true;
      if (window.requestAnimationFrame) {
        window.requestAnimationFrame(this.scrollColoredHeader.bind(this));
      }
      else {
         setTimeout(this.scrollColoredHeader.bind(this), 0);
      }
     }
  }

  scrollColoredHeader() {
    // if (!this.originalDimensions || typeof this.originalDimensions.top === 'undefined') {
    //   return;
    // }
    if (window.scrollY >= this.originalDimensions.top) {
      this.coloredHeader.style.backgroundColor = 'rgba(203, 188, 160, 1)';
      this.coloredHeader.style.position = 'fixed';
      this.coloredHeader.style.top = '0px';
      this.coloredHeader.style.marginTop = '0px';
      this.coloredHeader.style.zIndex = '3';
      this.coloredHeader.style.width = this.width = '100%';
      this.coloredHeader.style.fontWeight = '100';
      this.coloredHeader.style.boxShadow = '0px 2px 0px rgba(158, 146, 125, 0.2)';
    } else {
      this.coloredHeader.style.backgroundColor = 'rgba(203, 188, 160, 0)';
      this.coloredHeader.style.position = '';
      this.coloredHeader.style.top = '';
      this.coloredHeader.style.marginTop = '';
      this.coloredHeader.style.zIndex = '';
      this.coloredHeader.style.width = '';
      this.coloredHeader.style.fontWeight = 'bold'
      this.coloredHeader.style.boxShadow = '0px 2px 0px rgba(158, 146, 125, 0)'
    }
    this.onScrollRunning = false;
  }
}
