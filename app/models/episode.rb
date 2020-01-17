class Episode < ApplicationRecord
    has_many :appearances
    has_many :guests, through: :appearances
    
    def guest_rating(guest)
        self.appearances.find_by(guest: guest).rating
    end

    def average_rating
        (self.appearances.sum(&:rating).to_f/self.appearances.length.to_f).round(2)
    end
end
