import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "suggestions"]
  static values = { tags: Array }

  connect() {
    // Affiche les suggestions au fur et à mesure
    this.inputTarget.addEventListener("input", this.updateSuggestions.bind(this))

    // Ferme la liste si on quitte le champ input
    this.inputTarget.addEventListener("blur", () => {
      setTimeout(() => {
        this.suggestionsTarget.innerHTML = ""
      }, 150)
    })

    // Ferme aussi la liste si on valide le formulaire
    this.element.addEventListener("submit", () => {
      this.suggestionsTarget.innerHTML = ""
    })
  }

  updateSuggestions() {
    const query = this.inputTarget.value.toLowerCase()
    const matches = this.tagsValue.filter(tag =>
      tag.toLowerCase().includes(query)
    )
    this.renderSuggestions(matches)
  }

  renderSuggestions(matches) {
    this.suggestionsTarget.innerHTML = ""
    matches.forEach(tag => {
      const li = document.createElement("li")
      li.textContent = tag
      li.classList.add("suggestion-item")
      li.addEventListener("click", () => {
        this.inputTarget.value = tag
        this.suggestionsTarget.innerHTML = ""
      })
      this.suggestionsTarget.appendChild(li)
    })
  }
}
