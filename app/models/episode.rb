class Episode < ApplicationRecord
    has_many :appearances
    has_many :guests, through: :appearances

    def rating_for_appearance(guest)
        Appearance.find_by(guest_id: guest.id, episode_id: self.id).rating
    end

    def avg_rating
        total_ratings_length = self.appearances.length.to_f
        total_ratings_sum = self.appearances.sum{|appearance| appearance.rating}

        (total_ratings_sum/total_ratings_length)
    end
end
