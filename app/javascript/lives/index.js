console.log("hello from lives")

const newGameButton = document.getElementById("newGame");
const countryName = document.getElementById("countryName");

const lives = {
  initialize: () => {
    newGameButton.addEventListener('click', (event) => {
      event.preventDefault();
      console.log("new game pressed")
      lives.generateCharacter();
      lives.setCountry();
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
  selectCountry: (countries) => {
    const country = countries[Math.floor(Math.random()*countries.length)];
    countryName.innerHTML = country["name"]
    lives.player.country = country["name"]
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
