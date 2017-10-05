class Admin::ShowsController < Admin::AdminController
  def edit
    @show = Show.find(params[:id])
    @episodes = @show.episodes
  end
end
