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
const age = document.getElementById("age")

const lives = {
  initialize: () => {
    newGameButton.addEventListener('click', (event) => {
      event.preventDefault();
      console.log("new game pressed")
      lives.generateCharacter();
    });
  },
  generateCharacter: () => {
    console.log("generating character")
    lives.setLocation();
    lives.setAge();
  },
  setAge: () => {
    age.innerHTML = lives.player.age
  },
  setLocation: () => {
    lives.setCountry()
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
    map.removeLayer(markerVectorLayer);

    console.log(`lon: ${lives.player.longitude}`)
    console.log(`lat: ${lives.player.latitude}`)
    
    marker = new ol.Feature({
      geometry: new ol.geom.Point(
        ol.proj.fromLonLat([lives.player.longitude, lives.player.latitude])
      ),
    });
    
    vectorSource = new ol.source.Vector({
      features: [marker]
    });
    
    markerVectorLayer = new ol.layer.Vector({
      source: vectorSource,
    });
    
    map.addLayer(markerVectorLayer);
  },
  selectCountry: (countries) => {
    const country = countries[Math.floor(Math.random()*countries.length)];
    console.log(`Select Country: ${country["id"]}`)
    countryName.innerHTML = country["name"]
    lives.player.country = country["name"]
    lives.player.country_id = country["id"]
    lives.setCity();
  },
  setCity: () => {
    lives.fetchCities()
  },
  fetchCities: () => {
    console.log(`Country: ${lives.player.country}`)
    console.log(`Country ID: ${lives.player.country_id}`)
    fetch(`http://localhost:3000/cities?country_id=${lives.player.country_id}`)
      .then(response => response.json())
      .then(data => lives.selectCity(data))
  },
  selectCity: (cities) => {
    const city = cities[Math.floor(Math.random()*cities.length)];
    cityName.innerHTML = city["name"]
    lives.player.city = city["name"]
    lives.player.city_id = city["id"]
    lives.player.latitude = city["latitude"]
    lives.player.longitude = city["longitude"]
    console.log(`lon: ${city["longitude"]}`)
    console.log(`lat: ${city["latitude"]}`)
    lives.updateMap()
  },
  player: {
    firstName: "",
    lastName: "",
    fatherFirstName: "",
    fatherLastName: "",
    motherFirstName: "",
    motherLastName: "",
    career: "",
    health: 100,
    spouse: "",
    country: "",
    country_id: "",
    city: "",
    city_id: "",
    latitude: 40.7127,
    longitude: -74.006,
    age: 0
  }
}

lives.initialize();

export default lives;
