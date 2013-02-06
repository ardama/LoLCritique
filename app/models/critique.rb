class Critique < ActiveRecord::Base
  attr_accessible :content, :helpful, :rating, :user_id, :video_id
  
  belongs_to :user
  belongs_to :video
  
end
