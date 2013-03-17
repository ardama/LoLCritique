class VideosController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @videos = Video.all
    @per_page = 12
    @per_row = 4

    #Initialize thumbnail results to show all videos
    @watch_videos = @videos
    @critique_videos = @videos
    @upload_videos = []
    unless @user.nil?
      @upload_videos = @user.videos
    end
    champ = params[:champ]
    position = params[:position]
    phase = params[:phase]
    if champ=='None' or champ == nil
      champ = '%'
    end
    if position=='None' or position == nil
      position = '%'
    end
    if phase=='None' or phase == nil
      phase = '%'
    end
    focus = '.'
    if params[:focus] != nil
      params[:focus].each do |point|
        focus += point
        focus += '.'
      end
    end

    #Set appropriate tab's thumbnails according to filter
    #Set @tab instance variable to return to load page on correct tab
    @tab = params[:tab]
    if @tab == 'watch'
      @watch_videos = Video.search(champ,position,phase,focus)
    elsif @tab == 'critique'
      @critique_videos = Video.search(champ,position,phase,focus)
    elsif @tab == 'upload'
      @upload_videos = Video.search(champ,position,phase,focus)
    end

    @watch_videos = @watch_videos.sort_by{|video| video.created_at}.reverse
    @critique_videos = @critique_videos.sort_by{|video| video.rating}
    @upload_videos = @upload_videos.sort_by{|video| video.created_at}.reverse
  end


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
    linkParts = link.split('/')
    path = linkParts.last
    path = path.split('?').first
    @video = current_user.videos.create(:link => link, :champ => champ, :phase => phase, :position => position, :focus => focus, :description => description, :path=>path)
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
  end
end
