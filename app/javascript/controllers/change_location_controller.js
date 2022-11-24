import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="change-location"
export default class extends Controller {

  connect() {
    console.log("Connected to change-location controller")
  }
  goToLocation(event){
    console.log(event.currentTarget.dataset.lat)
    console.log(event.currentTarget.dataset.lng)
  }
}
