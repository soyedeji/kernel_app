# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'http'


response = HTTP.get('https://dog.ceo/api/breeds/list/all')
breeds = response.parse['message'].keys

breeds.each do |breed|
  breed_record = Breed.create!(name: breed)

  # Fetch random images for each breed
  images_response = HTTP.get("https://dog.ceo/api/breed/#{breed}/images/random/3")
  images = images_response.parse['message']

  images.each do |url|
    breed_record.images.create!(url: url)
  end
end
