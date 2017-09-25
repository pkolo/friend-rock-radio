class EpisodesController < ApplicationController
  def index
    @show = Show.find(params[:show_id])
    @episodes = @show.episodes.all
  end

  def new
    @show = Show.find(params[:show_id])
    @episode = Episode.new
  end

  def create
    @show = Show.find(params[:show_id])
    @episode = Episode.new(episode_params)
    @episode.show = @show
    if @episode.save
      redirect_to edit_episode_path @episode
    else
      render 'new'
    end
  end

  def edit
    @show = Show.find(params[:show_id])
    @episode = Episode.find(params[:id])
  end

  private
    def episode_params
      params.require(:episode).permit(:title)
    end
end
