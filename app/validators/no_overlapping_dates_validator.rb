class NoOverlappingDatesValidator < ActiveModel::Validator
  def validate(record) 
    if record.listing.overlaping_reservation?(record.start_date, record.end_date) 
      record.errors.add(:base, "Those dates are not available")
    end
  end
end