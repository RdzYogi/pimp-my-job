import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
  }
  static targets = [ "map" ]

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    const map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    this.map = map
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    const btns = document.querySelectorAll(".location-change")
    const mapC = document.querySelector("#map")

    btns.forEach((btn) => {
      btn.addEventListener("click", (event) => {
        const lat = event.currentTarget.dataset.lat
        const lng = event.currentTarget.dataset.lng
        const map = new mapboxgl.Map({
          container: 'map',
          style: "mapbox://styles/mapbox/streets-v10",
          center: [lng, lat],
          zoom: 9
        })
        new mapboxgl.Marker()
            .setLngLat([ lng, lat ])
            .addTo(map)
      })
    })
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })
  }
  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
