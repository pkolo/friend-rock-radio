class AddPublishedAndDescriptionToEpisodes < ActiveRecord::Migration[5.1]
  def change
    add_column :episodes, :published, :boolean
    add_column :episodes, :description, :text
  end
end
