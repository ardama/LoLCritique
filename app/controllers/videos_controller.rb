class VideosController < ApplicationController
  def create
    link = params[:video][:link]
    champ = params[:video][:champ]
    position = params[:video][:position]
    phase = params[:video][:phase]
    focus = ''
    params[:video][:focus].each do |point|
    	focus += point
    	focus += '.'
    end
    description = params[:video][:description]
    @video = current_user.videos.create(:link => link, :champ => champ, :phase => phase, :position => position, :focus => focus, :description => description)
    redirect_to root_path
  end

  def show
  	@user = current_user
  	@video = Video.find(params[:id])
    session[:video_id] = @video.id
  	@videoPath = @video.link.gsub('.be', 'be.com/embed') 
  	@focusPoints = @video.focus.split('.')
  	if (@focusPoints[0] == "")
  		@focusPoints.shift
  	end
  	#@videoPath = 'http://youtube.com/embed/a3fA_1OmcJY'
  end
end
