class Video < ActiveRecord::Base
  attr_accessible :champ, :focus, :phase, :position, :rating, :user_id
  
  has_many :critiques
  belongs_to :user
end
