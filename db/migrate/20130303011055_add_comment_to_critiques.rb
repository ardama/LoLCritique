class AddCommentToCritiques < ActiveRecord::Migration
  def change
    add_column :critiques, :comment, :text, :limit => 1000
  end
end
