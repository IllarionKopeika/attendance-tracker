import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    flatpickr.localize(flatpickr.l10ns.zh)

    flatpickr(this.element, {
      locale: {
        firstDayOfWeek: 1
      },
      position: "auto center",
      minDate: new Date().fp_incr(-365),
      maxDate: new Date().fp_incr(365),
      altInput: true,
      altFormat: "Y-m-d",
      dateFormat: "Y-m-d",
      disableMobile: true,
    })
  }
}
