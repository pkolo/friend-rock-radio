class CreatesJoinTableTracksLabels < ActiveRecord::Migration[5.1]
  def change
    create_join_table :tracks, :labels do |t|
      t.index [:track_id, :label_id]
      t.index [:label_id, :track_id]
    end
  end
end
