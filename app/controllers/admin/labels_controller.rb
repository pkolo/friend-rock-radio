class Admin::LabelsController < ApplicationController
  def create
    @label = Label.new(label_params)
    if @label.save
      render json: @label, status: :created
    else
      render json: { errors: @label.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

    def label_params
      params.require(:label).permit(:name)
    end
end
