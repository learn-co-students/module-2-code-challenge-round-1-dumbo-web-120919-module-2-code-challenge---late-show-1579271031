class Guest < ApplicationRecord
  has_many :appearances
  has_many :episodes, through: :appearances


  def order_appearance
    self.appearances.sort_by do |appearance|
      byebug
      appearance[:rating]
    end
  end



end
