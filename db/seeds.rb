# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'

# TODO: replace to bulk insert - activerecord-import?
def load_geo_data
  countries_hash = JSON.parse(File.read(Rails.root.join('lib/countries_data/countries.json')))
  cities_hash = JSON.parse(File.read(Rails.root.join('lib/countries_data/cities.json')))
  countries_hash.each do |country_hash|
    cities_arr = cities_hash[country_hash['name']]

    next if cities_arr.nil?

    country_model = create_country country_hash
    create_cities(country_model, cities_arr)
  end
end

def create_country(country_hash)
  Country.create(name: country_hash['name'],
                 short_code: country_hash['code'],
                 phone_code: country_hash['dial_code'])
end

def create_cities(country_model, cities)
  cities.each { |city| City.create(name: city, country: country_model) }
end

load_geo_data
