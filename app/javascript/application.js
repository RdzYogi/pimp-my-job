// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

const wrapper = document.getElementById("wrapper");

const rand = (min, max) => Math.floor(Math.random() * (max - min + 1) + min);

const uniqueRand = (min, max, prev) => {
  let next = prev;

  while(prev === next) next = rand(min, max);

  return next;
}

const combinations = [
  { configuration: 1, roundness: 1 },
  { configuration: 1, roundness: 2 },
  { configuration: 1, roundness: 4 },
  { configuration: 2, roundness: 2 },
  { configuration: 2, roundness: 3 },
  { configuration: 3, roundness: 3 }
];

let prev = 0;
if (wrapper != null) {
  setInterval(() => {
    const index = uniqueRand(0, combinations.length - 1, prev),
          combination = combinations[index];

    wrapper.dataset.configuration = combination.configuration;
    wrapper.dataset.roundness = combination.roundness;
    wrapper.dataset.text = index + 1;

    prev = index;
  }, 3000);

}

const btns = document.querySelectorAll(".location-change")
const mapC = document.querySelector("#map")

btns.forEach((btn) => {
  btn.addEventListener("click", (event) => {
    console.log(event.currentTarget.dataset.lat)
    console.log(event.currentTarget.dataset.lng)
    const lat = event.currentTarget.dataset.lat
    const lng = event.currentTarget.dataset.lng
    // mapboxgl.accessToken = this.apiKeyValue
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
