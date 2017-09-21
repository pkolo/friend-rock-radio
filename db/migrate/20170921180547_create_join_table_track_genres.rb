class CreateJoinTableTrackGenres < ActiveRecord::Migration[5.1]
  def change
    create_join_table :tracks, :genres do |t|
      # t.index [:track_id, :genre_id]
      # t.index [:genre_id, :track_id]
    end
  end
end
