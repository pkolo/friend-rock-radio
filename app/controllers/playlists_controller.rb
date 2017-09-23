class PlaylistsController < ApplicationController
  def create
    binding.pry
    @episode = Episode.find(params[:episode_id])
    @playlist = Playlist.new(playlist_params)
    @playlist.episode = @episode
  end

  private
    def playlist_params
      params.require(:playlist).permit(:time_marker, track_attributes: [
                      :id,
                      :title,
                      :year,
                      :_destroy,
                      bands_attributes: [
                        :id,
                        :name
                      ],
                      genres_attributes: [
                        :id,
                        :name
                      ],
                      labels_attributes: [
                        :id,
                        :name
                      ]
                   ]
                  )
    end
end
