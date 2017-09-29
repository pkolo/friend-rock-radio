class PlaylistsController < ApplicationController
  def create
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
