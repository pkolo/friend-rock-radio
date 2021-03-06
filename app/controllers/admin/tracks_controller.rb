class Admin::TracksController < Admin::AdminController
  def create
    @track = Track.new(track_params)
    if @track.save
      render json: @track, status: :created
    else
      render json: { errors: @track.errors.full_messages }
    end
  end

  private

    def track_params
      params.require(:track).permit(:title, :year, band_ids: [], label_ids: [], genre_ids: [])
    end
end
