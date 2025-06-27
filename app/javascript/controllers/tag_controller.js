import { Controller } from "@hotwired/stimulus"
import "select2"

export default class extends Controller {
  connect() {
    const $ = window.$ // ou window.jQuery si nécessaire
    $(this.element).select2({
      tags: true,
      width: '100%',
      placeholder: "Choisissez ou ajoutez un tag",
      allowClear: true
    })
  }
}
