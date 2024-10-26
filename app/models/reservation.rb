class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  validates :start_date,
    presence: true
  
  validates :end_date,
    presence: true, 
    comparison: { greater_than: :start_date }

  validates_with NoOverlappingDatesValidator


  def duration
    (self.end_date.to_date - self.start_date.to_date).to_i
  end

end
