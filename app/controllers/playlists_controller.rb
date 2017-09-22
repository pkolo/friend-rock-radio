class PlaylistsController < ApplicationController
  def create
    binding.pry
  end

  private
    def playlist_params
      params.require(:playlist)
            .permit(:time_marker,
                    track_attributes: [
                      :id,
                      :title,
                      :year,
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
