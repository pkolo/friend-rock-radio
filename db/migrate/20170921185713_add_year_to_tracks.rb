class AddYearToTracks < ActiveRecord::Migration[5.1]
  def change
    add_column :tracks, :year, :integer
  end
end
