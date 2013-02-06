class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :user_id
      t.integer :rating
      t.string :champ
      t.string :focus
      t.string :position
      t.string :phase

      t.timestamps
    end
  end
end
