import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "form" ]

  reset() {
    this.formTarget.reset()
    this.formTarget.requestSubmit()
  }
}
