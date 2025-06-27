import { Controller } from "@hotwired/stimulus"
import $ from "jquery"
import "select2"

export default class extends Controller {
  connect() {
    $(this.element).select2({
      tags: true,
      width: '100%',
      placeholder: "Choisissez ou ajoutez un tag",
      allowClear: true
    })
  }
}
