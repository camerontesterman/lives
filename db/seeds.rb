# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

all_countries = Country.all

all_countries.each do |country|
  cities = country.cities

  cities.each do |city|
    city.destroy
  end

  country.destroy
end

Language.all.each do |language|
  language.destroy
end

countries = [
  {
    name: 'Afghanistan',
    country_code: 'AF',
    population: 32225560
  },
  {
    name: 'Albania',
    country_code: 'AL',
    population: 2821977
  },
  {
    name: 'Australia',
    country_code: 'AU',
    population: 25519100
  },
  {
    name: 'Belarus',
    country_code: 'BY',
    population: 9491800
  },
  {
    name: 'Canada',
    country_code: 'CA',
    population: 37602103
  },
  {
    name: 'China',
    country_code: 'CN',
    population: 1403500365
  },
  {
    name: 'Japan',
    country_code: 'JP',
    population: 126317000
  }
]

countries.each do |country|
  define_method(country[:name].downcase.to_sym) do ||
    Country.find_by(name: country[:name])
  end

  Country.create country
end

languages = [
  {
    name: 'English',
    country_ids: [canada.id, australia.id]
  },
  {
    name: 'Pashto',
    country_ids: [afghanistan.id]
  },
  {
    name: 'Albanian',
    country_ids: [albania.id]
  },
  {
    name: 'Belarusian',
    country_ids: [belarus.id]
  },
  {
    name: 'Mandarin',
    country_ids: [china.id]
  },
  {
    name: 'Japanese',
    country_ids: [japan.id]
  }
]

languages.each do |language|
  Language.create language
end

cities = [
  # Afghanistan
  { 
    name: 'Kabul',
    population: 4273200,
    country_id: afghanistan.id,
    latitude: 34.3131,
    longitude: 69.1042
  },
  { 
    name: 'Kandahar',
    population: 614300,
    country_id: afghanistan.id,
    latitude: 31.37,
    longitude: 65.43
  },
  { 
    name: 'Herat',
    population: 556200,
    country_id: afghanistan.id,
    latitude: 34.2031,
    longitude: 62.1211
  },
  { 
    name: 'Mazar-i-Sharif',
    population: 469200,
    country_id: afghanistan.id,
    latitude: 36.42,
    longitude: 67.07
  },
  { 
    name: 'Kunduz',
    population: 356500,  
    country_id: afghanistan.id,
    latitude: 36.4343,
    longitude: 68.525
  },
  # Albania
  { 
    name: 'Tirana',
    population: 418495,
    country_id: albania.id,
    latitude: 41.1944,
    longitude: 19.4904
  },
  { 
    name: 'Durrës',
    population: 113249,
    country_id: albania.id,
    latitude: 41.19,
    longitude: 19.27
  },
  # Australia
  { 
    name: 'Sydney',
    population: 5230330,
    country_id: australia.id,
    latitude: -33.5154,
    longitude: 151.1234
  },
  # Belarus
  {
    name: 'Minsk',
    population: 1995000,
    country_id: belarus.id,
    latitude: 53.54,
    longitude: 27.34
  },
  # Canada
  {
    name: 'Toronto',
    population: 5928040,
    country_id: canada.id,
    latitude: 43.4430,
    longitude: -79.2224
  },
  # China
  {
    name: 'Shanghai',
    population: 24237800,
    country_id: china.id,
    latitude: 31.1343,
    longitude: 121.2829
  },
  # Japan
  {
    name: 'Tokyo',
    population: 13929286,
    country_id: japan.id,
    latitude: 35.4123,
    longitude: 139.4132
  }
]

cities.each do |city|
  City.create city
end
