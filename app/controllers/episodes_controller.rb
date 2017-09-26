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
      redirect_to show_episode_path @show, @episode
    else
      @errors = @episode.errors.full_messages
      render 'new'
    end
  end

  def show
    @show = Show.find(params[:show_id])
    @episode = Episode.find(params[:id])
  end

  def edit
    @show = Show.find(params[:show_id])
    @episode = Episode.find(params[:id])
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
      params.require(:episode)
            .permit(:title,
                    playlists_attributes: [
                      :time_marker, track_attributes: [
                                    :id,
                                    :title,
                                    :year,
                                    :_destroy,
                                    bands_attributes: [
                                      :id,
                                      :name
                                    ],
                                    genres_attributes: [
                                      :id,
                                      :name
                                    ],
                                    labels_attributes: [
                                      :id,
                                      :name
                                    ]
                                 ]
                              ]
                            )
    end
end
