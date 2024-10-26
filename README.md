
#**Airbnb Clone Project**
A simple clone of Airbnb using Ruby on Rails, allowing users to manage listings and make reservations.

##**Features**
  - User registration and profile management.
  - Listings with details like available beds, price, and description.
  - Booking system with date validation to prevent overlaps.
  - Seed data for quick setup.

##**Setup**
  - Prerequisites
  - Ruby 3.2.2
  - Rails 7.2.x
  - PostgreSQL

##**Models**
  - User: has_many :listings, has_many :reservations
  - City: has_many :listings
  - Listing: belongs_to :user, belongs_to :city, has_many :reservations
  - Reservation: belongs_to :user, belongs_to :listing

##**Validations**
  - Custom validation to prevent overlapping reservations.
  - Email and phone number validation for users.
  - Listing must have positive beds and price.

##**Seed Data**
  - 20 users
  - 10 cities
  - 50 listings
  - Reservations with non-overlapping dates

