class CreateAppearances < ActiveRecord::Migration[5.1]
  def change
    create_table :appearances do |t|
      t.integer :rating
      t.integer :guest_id, foreign_key: true
      t.integer :episode_id, foreign_key: true
      t.timestamps
    end
  end
end
