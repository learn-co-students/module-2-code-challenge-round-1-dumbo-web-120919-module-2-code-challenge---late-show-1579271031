class Episode < ApplicationRecord
    has_many :appearances
    has_many :guests, through: :appearances

    def avg_rating
        num_of_apps = self.appearances.length
        total_rating = self.appearances.sum {|app| app.rating }
        total_rating / num_of_apps
    end
end
