class CreateCritiques < ActiveRecord::Migration
  def change
    create_table :critiques do |t|
      t.integer :user_id
      t.integer :video_id
      t.integer :rating
      t.boolean :helpful
      t.string :content

      t.timestamps
    end
  end
end
