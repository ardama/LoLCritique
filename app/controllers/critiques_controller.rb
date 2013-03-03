class CritiquesController < ApplicationController
  def create
  	comment = params[:critique][:comment]
  	user_id = params[:critique][:user_id]
  	video_id = session[:video_id]
  	@critique = current_user.critiques.create(:comment => comment, :user_id => user_id, :video_id => video_id)
  	redirect_to 'videos/'+video_id.to_s+'/show'

  end

  def show
  	@critique = Critique.find(params[:id])
  	@critiques = Critique.all
  end
end