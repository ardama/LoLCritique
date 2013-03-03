class AddDescriptionToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :description, :text, :limit => 250
  end
end
