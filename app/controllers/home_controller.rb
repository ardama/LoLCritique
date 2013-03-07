class HomeController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @videos = Video.all

    champ = params[:champ]
    position = "Mid Lane"#params[:position]
    phase = "Early/Laning"#params[:phase]
    focus = '.'
    @results = Video.search(champ,position,phase,focus)
  end

  def filter
    champ = params[:champ]
    position = "Mid Lane"#params[:position]
    phase = "Early/Laning"#params[:phase]
    focus = '.'
#    params[:focus].each do |point|
 #   	focus += point
  #  	focus += '.'
   # end
  	@results = Video.search(champ,position,phase,focus)
  end
end
