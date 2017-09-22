class PlaylistsController < ApplicationController
  def create
  end

  private
    def playlist_params
      params.require(:playlist).permit(:time_marker)
    end
end
