import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-map"
export default class extends Controller {
  static values = {
    apiKey: String
  }
  connect(event) {
    console.log(this.data.element.dataset.mapApiKeyValue)
    mapboxgl.accessToken = this.data.element.dataset.mapApiKeyValue
    const lat = this.data.element.dataset.lat
    const lng = this.data.element.dataset.lng
    const map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [lng, lat],
      zoom: 9
    })
    new mapboxgl.Marker()
        .setLngLat([ lng, lat ])
        .addTo(map)
  }
}
