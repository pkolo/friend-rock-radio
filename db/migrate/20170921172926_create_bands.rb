class CreateBands < ActiveRecord::Migration[5.1]
  def change
    create_table :bands do |t|
      t.string :name, null: false
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
