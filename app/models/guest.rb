class Guest < ApplicationRecord
  has_many :appearances
  has_many :episodes, through: :appearances

  # def appearance_rating(episode)
  #   @appearance = Appearance.where("guest_id = ? AND episode_id = ?", self, episode)
  #   @appearance.rating
  # end

  # Got stuck on this bug-- for some reason I couldn't call .rating on my Appearance instances, despite them having their ratings successfully validated and saved to the database. Because of this I couldn't successfully list their ratings on the Guest show pages, or continue with the advanced steps.

end
