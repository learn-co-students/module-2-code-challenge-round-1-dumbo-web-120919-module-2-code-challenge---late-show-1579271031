class Episode < ApplicationRecord
  has_many :appearances
  has_many :guests, through: :appearances


  def average_rating
    total = 0 
    self.appearances.each do |appearance|
      total += appearance.rating
  end
  total / self.guests.length 
end
end
