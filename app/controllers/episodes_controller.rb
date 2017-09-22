class EpisodesController < ApplicationController
  def index
    @show = Show.find(params[:show_id])
    @episodes = @show.episodes.all
  end

  def new
    @episode = Episode.new
  end

  def create
    @episode = Episode.new(episode_params)
    if @episode.save
      redirect_to episode_edit_path @episode
    else
      render 'new'
    end
  end

  private
    def episode_params
      params.require(:episode).permit(:title)
    end
end
