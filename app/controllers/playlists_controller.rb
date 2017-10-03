class PlaylistsController < ApplicationController

  def new
    @episode = Episode.find(params[:episode_id])
    @playlist = Playlist.new
    render 'new', layout: false
  end

  def create
    @episode = Episode.find(params[:episode_id])
    @playlist = Playlist.new(playlist_params)
    @playlist.episode = @episode
    if @playlist.save
      render partial: 'episodes/playlist', layout: false, locals: {playlist: @playlist}
    else
      render json: { errors: @playlist.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
    def playlist_params
      params.require(:playlist).permit(:time_marker, :title, :track_id)
    end
end
