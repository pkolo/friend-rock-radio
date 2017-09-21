class CreateJoinTableTracksBands < ActiveRecord::Migration[5.1]
  def change
    create_join_table :tracks, :bands do |t|
      t.index [:track_id, :band_id]
      t.index [:band_id, :track_id]
    end
  end
end
