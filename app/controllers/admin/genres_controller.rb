class Admin::GenresController < ApplicationController
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      render json: @genre, status: :created
    else
      render json: { errors: @genre.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

    def genre_params
      params.require(:genre).permit(:name)
    end
end
