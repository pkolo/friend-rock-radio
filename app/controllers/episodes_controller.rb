class EpisodesController < ApplicationController
  def index
    @show = Show.find(params[:show_id])
    @episodes = @show.episodes.all
  end

  def show
    @show = Show.find(params[:show_id])
    @episode = Episode.find(params[:id])
    @playlists = @episode.playlists.play_order
  end
end
