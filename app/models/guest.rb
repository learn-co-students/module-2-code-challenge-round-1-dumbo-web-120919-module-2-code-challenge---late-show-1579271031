class Guest < ApplicationRecord
    has_many :appearances
    has_many :episodes, through: :appearances

    def sorted_eps
        self.episodes.sort_by{|episode| episode.appearances.find_by(guest: self).rating}.reverse
    end
end
