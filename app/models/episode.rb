class Episode < ApplicationRecord
    has_many :appearaces
    has_many :guests, through: :appearances
end
