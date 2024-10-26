# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Détruire les données existantes
Reservation.destroy_all
Listing.destroy_all
City.destroy_all
User.destroy_all

require 'faker'

20.times do 
  User.create!(
    email: Faker::Internet.unique.email,
    phone_number: "0#{rand(6..7)}#{rand(10000000..99999999)}",
    description: Faker::Lorem.paragraph_by_chars(number: 100)
)
end
puts "Création des 20 users"

10.times do
   City.create!(
    name: Faker::Address.city,
    zip_code: Faker::Number.within(range: 1000..95999).to_s.rjust(5, '0')
)
end
puts "Création des 10 cities"

50.times do 
  Listing.create!(
    bed_available: Faker::Number.within(range: 1..10),
    price: Faker::Number.within(range: 1..1000),
    description: Faker::Lorem.paragraph_by_chars(number: 140),
    has_wifi: [true, false].sample,
    welcome_message: Faker::Lorem.paragraph_by_chars(number: 160),
    city: City.all.sample, 
    user: User.all.sample
  )
end
puts "Création des 50 listings"

Listing.all.each do |listing|
  5.times do 
    begin
      start_date = Faker::Date.forward(days: rand(1..30))
      end_date = start_date + rand(1..10).days
      Reservation.create!(
        start_date: start_date,
        end_date: end_date,
        user: User.all.sample,
        listing: listing
      )
    rescue ActiveRecord::RecordInvalid => e
      puts "Skipping reservation due to validation: #{e.message}"
    end
  end 
end 
puts "Création des 5 réservations futures pour chaque listing"

Listing.all.each do |listing|
  5.times do 
    begin
      start_date = Faker::Date.backward
      end_date = start_date + rand(1..10).days
      Reservation.create!(
        start_date: start_date,
        end_date: end_date,
        user: User.all.sample,
        listing: listing
      )
    rescue ActiveRecord::RecordInvalid => e
      puts "Skipping reservation due to validation: #{e.message}"
    end 
  end
end

puts "Création des 5 réservations passées pour chaque listing"


