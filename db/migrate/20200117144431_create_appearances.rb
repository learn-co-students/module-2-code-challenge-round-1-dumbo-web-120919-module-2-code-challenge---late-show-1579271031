class CreateAppearances < ActiveRecord::Migration[5.1]
  def change
    create_table :appearances do |t|
      t.integer :rating
      t.string :guest_id
      t.string :episode_id

      t.timestamps
    end
  end
end
