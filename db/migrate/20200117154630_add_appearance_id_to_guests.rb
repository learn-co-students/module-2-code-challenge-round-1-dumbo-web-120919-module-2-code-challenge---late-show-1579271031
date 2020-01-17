class AddAppearanceIdToGuests < ActiveRecord::Migration[5.1]
  def change
    add_column :guests, :appearance_id, :integer
  end
end
