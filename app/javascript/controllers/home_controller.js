import { Controller } from "@hotwired/stimulus"


export default class extends Controller {

  connect() {
    console.log(this.data.element.dataset)
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
    this.data.element.dataset.configuration = combinations[prev].configuration;
    this.data.element.dataset.roundness = combinations[prev].roundness;
    this.data.element.dataset.text = prev + 1;
    setInterval(() => {
      const index = uniqueRand(0, combinations.length - 1, prev),
            combination = combinations[index];

      this.data.element.dataset.configuration = combination.configuration;
      this.data.element.dataset.roundness = combination.roundness;
      this.data.element.dataset.text = index + 1;

      prev = index;
    }, 3000);
  }
}
