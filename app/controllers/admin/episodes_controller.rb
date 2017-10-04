class Admin::EpisodesController < ApplicationController
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
      redirect_to edit_show_episode_path @show, @episode
    else
      @errors = @episode.errors.full_messages
      render 'new'
    end
  end

  def show
    @show = Show.find(params[:show_id])
    @episode = Episode.find(params[:id])
    @playlists = @episode.playlists.play_order
  end

  def edit
    @show = Show.find(params[:show_id])
    @episode = Episode.find(params[:id])
    @playlists = @episode.playlists.order(:time_marker)
  end

  def update
    @show = Show.find(params[:show_id])
    @episode = Episode.find(params[:id])
    if @episode.update(episode_params)
      redirect_to show_episode_path @show, @episode
    else
      @errors = @episode.errors.full_messages
      render 'edit'
    end
  end

  private
    def episode_params
      params.require(:episode).permit(:title, :description, :published)
    end
end
