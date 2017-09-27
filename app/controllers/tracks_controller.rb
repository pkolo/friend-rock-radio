class TracksController < ApplicationController
  def create
    @track = Track.new(track_params)
    binding.pry
  end

  private

    def track_params
      params.require(:track).permit(:title, :year)
    end
end
