import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "suggestions", "clear"]
  static values = { tags: Array }

  connect() {
    this.inputTarget.addEventListener("input", () => {
      this.updateSuggestions()
      this.toggleClearButton()
    })

    this.inputTarget.addEventListener("blur", () => {
      setTimeout(() => {
        this.suggestionsTarget.innerHTML = ""
        this.suggestionsTarget.classList.remove("show")
      }, 150)
    })

    this.element.addEventListener("submit", () => {
      this.suggestionsTarget.innerHTML = ""
      this.suggestionsTarget.classList.remove("show")
    })

    if (this.hasClearTarget) {
      this.clearTarget.addEventListener("click", () => {
        this.inputTarget.value = ""
        this.inputTarget.focus()
        this.suggestionsTarget.innerHTML = ""
        this.suggestionsTarget.classList.remove("show")
        this.toggleClearButton()
      })
    }

    this.toggleClearButton()
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

    if (matches.length === 0) {
      this.suggestionsTarget.classList.remove("show")
      return
    }

    matches.forEach(tag => {
      const li = document.createElement("li")
      li.textContent = tag
      li.classList.add("suggestion-item")
      li.addEventListener("click", () => {
        this.inputTarget.value = tag
        this.suggestionsTarget.innerHTML = ""
        this.suggestionsTarget.classList.remove("show")
        this.toggleClearButton()
      })
      this.suggestionsTarget.appendChild(li)
    })

    this.suggestionsTarget.classList.add("show")
  }

  toggleClearButton() {
    if (this.hasClearTarget) {
      this.clearTarget.style.display = this.inputTarget.value ? "block" : "none"
    }
  }
}
