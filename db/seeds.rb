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
  Country.create(
    name: country[:name],
    country_code: country[:country_code],
    population: country[:population]
  )
end
