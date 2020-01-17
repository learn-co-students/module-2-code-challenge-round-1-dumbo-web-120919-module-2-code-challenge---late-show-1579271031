class Appearance < ApplicationRecord
    belongs_to :episode
    belongs_to :guest

    validates :rating, length: { maximum: 5 }
end
