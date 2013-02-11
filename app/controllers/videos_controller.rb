class VideosController < ApplicationController
  def create
    @video = current_user.videos.create()
    redirect_to root_path
  end
end
