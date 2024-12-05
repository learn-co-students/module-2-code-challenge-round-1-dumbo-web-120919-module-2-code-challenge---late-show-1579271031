class Guest < ApplicationRecord
has_many :appearances
has_many :episodes, through: :appearances
    # def fullname
    
    # end
end
