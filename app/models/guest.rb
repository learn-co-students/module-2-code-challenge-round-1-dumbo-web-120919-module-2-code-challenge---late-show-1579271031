class Guest < ApplicationRecord
    has_many :appearances
    has_many :episodes, through: :appearances

    #Sort episodes by their rating.
    def sort_episodes_by_rating
        #This one is a little tricky. In the Episode model, I have a method that returns the rating for a specific appearance.
        #The .sort enumerable sorts by ascending by default. I'm using the space-ship operator to reverse that by comparing the subsequent
        #value against the current so that it sorts appropriately.

        #primary resource: https://mixandgo.com/learn/ruby-sort-and-sort-by (Note: I was already familiar with this operator and sorting algo.)
        self.episodes.sort{ |ep, next_ep| next_ep.rating_for_appearance(self) <=> ep.rating_for_appearance(self) }
    end
end
