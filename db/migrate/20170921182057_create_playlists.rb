class CreatePlaylists < ActiveRecord::Migration[5.1]
  def change
    create_table :playlists do |t|
      t.integer :time_marker
      t.references :episode, foreign_key: true
      t.references :track, foreign_key: true

      t.timestamps
    end
  end
end
