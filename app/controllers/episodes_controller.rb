class EpisodesController < ApplicationController
  def index
    @show = Show.find(params[:show_id])
    @episodes = @show.episodes.all
  end

  def new
    @episode = Episode.new
  end
end
