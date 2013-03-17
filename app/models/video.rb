class Video < ActiveRecord::Base
  attr_accessible :champ, :focus, :phase, :position, :rating, :user_id, :link, :description, :path
  
  has_many :critiques
  belongs_to :user

  def self.search(champ,position,phase,focus)
  	query_results = where("champ LIKE ? AND position LIKE ? AND phase LIKE ?",champ,position,phase)
  	videos = Array.new
  	query_focus = focus.split('.')
  	query_results.each do |result|
  		video_focus = result.focus
  		contains_all = true
  	  query_focus.each do |focus|
  	  	unless video_focus.include? focus
  	  		contains_all = false
  	  	end
	  	end
	  	if contains_all
	  		videos.push(result)
	  	end
		end
  	return videos
  end
end
