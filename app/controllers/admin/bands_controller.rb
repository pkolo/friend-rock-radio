class Admin::BandsController < Admin::AdminController
  def create
    @band = Band.new(band_params)
    if @band.save
      render json: @band, status: :created
    else
      render json: { errors: @band.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

    def band_params
      params.require(:band).permit(:name)
    end
end
