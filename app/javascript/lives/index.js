var map = new ol.Map({
  target: 'map',
  layers: [
    new ol.layer.Tile({
      source: new ol.source.OSM()
    })
  ],
  view: new ol.View({
    center: [0, 0],
    zoom: 0
  })
});

var marker = new ol.Feature({
  geometry: new ol.geom.Point(
    ol.proj.fromLonLat([-74.006,40.7127])
  ),
});

var vectorSource = new ol.source.Vector({
  features: [marker]
});

var markerVectorLayer = new ol.layer.Vector({
  source: vectorSource,
});

map.addLayer(markerVectorLayer);

const newGameButton = document.getElementById("newGame");
const countryName = document.getElementById("countryName");
const cityName = document.getElementById("cityName")

const lives = {
  initialize: () => {
    newGameButton.addEventListener('click', (event) => {
      event.preventDefault();
      console.log("new game pressed")
      lives.generateCharacter();
      lives.setCountry();
      lives.setCity();
    });
  },
  generateCharacter: () => {
    console.log("generating character")
  },
  setCountry: () => {
    lives.fetchCountries();
  },
  fetchCountries: () => {
    fetch("http://localhost:3000/countries")
      .then(response => response.json())
      .then(data => lives.selectCountry(data))
  },
  updateMap: () => {
    map.getView().setCenter(ol.proj.transform([67.7100, 33.9391], 'EPSG:4326', 'EPSG:3857'));
  },
  selectCountry: (countries) => {
    const country = countries[Math.floor(Math.random()*countries.length)];
    countryName.innerHTML = country["name"]
    lives.player.country = country["name"]
  },
  setCity: () => {
    lives.fetchCities()
  },
  fetchCities: () => {
    fetch("http://localhost:3000/cities")
      .then(response => response.json())
      .then(data => lives.selectCity(data))
  },
  selectCity: (cities) => {
    const city = cities[Math.floor(Math.random()*cities.length)];

  },
  player: {
    firstName: "",
    lastName: "",
    career: "",
    health: 100,
    spouse: "",
    country: "",
    age: 0
  }
}

lives.initialize();

export default lives;
