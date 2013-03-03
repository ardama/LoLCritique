class AddCommentToCritiques < ActiveRecord::Migration
  def change
    add_column :critiques, :comment, :text
  end
end
