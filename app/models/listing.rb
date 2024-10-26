class Listing < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_many :reservations

  validates :bed_available,
    presence: true, 
    numericality: { only_integer: true, greater_than: 0}

  validates :price,
    presence: true, 
    numericality: {only_integer: true, greater_than: 0}

  validates :description,
    presence: true, 
    length: { minimum: 140 }

  validates :has_wifi,
    inclusion: [true, false]
  
  validates :welcome_message,
    presence: true

  def overlaping_reservation?(start_date, end_date)
    reservations.any? do |reservation|
      (start_date < reservation.end_date) && (end_date > reservation.start_date)
    end
  end

end
