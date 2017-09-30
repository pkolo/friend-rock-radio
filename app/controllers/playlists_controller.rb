class PlaylistsController < ApplicationController

  def new
    @episode = Episode.find(params[:episode_id])
    @playlist = Playlist.new
    render 'new', layout: false
  end

  def create
    binding.pry
    @episode = Episode.find(params[:episode_id])
    @playlist = Playlist.new(playlist_params)
    @playlist.episode = @episode
    if @playlist.save
      render json: @playlist, status: :created
    else
      render json: { errors: @playlist.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
    def playlist_params
      params.require(:playlist).permit(:time_marker, :track_id)
    end
end
