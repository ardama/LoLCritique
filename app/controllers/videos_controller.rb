class VideosController < ApplicationController
  def create
    @video = current_user.videos.create()
  end
end
