class CreateEpisodes < ActiveRecord::Migration[5.1]
  def change
    create_table :episodes do |t|
      t.string :title, null: false
      t.references :show, foreign_key: true

      t.timestamps
    end
  end
end
