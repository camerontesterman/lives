# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
  }
]

countries.each do |country|
  define_method(country[:name].downcase.to_sym) do ||
    Country.find_by(name: country[:name])
  end

  Country.create(
    name: country[:name],
    country_code: country[:country_code],
    population: country[:population]
  )
end

cities = [
  # Afghanistan
  { name: 'Kabul',          population: 4273200, country_id: afghanistan.id },
  { name: 'Kandahar',       population: 614300,  country_id: afghanistan.id },
  { name: 'Herat',          population: 556200,  country_id: afghanistan.id },
  { name: 'Mazar-i-Sharif', population: 469200,  country_id: afghanistan.id },
  { name: 'Kunduz',         population: 356500,  country_id: afghanistan.id },
  # Albania
  { name: 'Tirana',         population: 418495,  country_id: albania.id },
  { name: 'Durrës',         population: 113249,  country_id: albania.id},
  # Australia
  { name: 'Sydney',         population: 5230330, country_id: australia.id }
]

cities.each do |city|
  City.create(
    name: city[:name],
    population: city[:population],
    country_id: city[:country_id]
  )
end
