class Appearance < ApplicationRecord
    has_many :guests
    belongs_to :episode

    validates :rating, inclusion: { in: 1..5 }
end
