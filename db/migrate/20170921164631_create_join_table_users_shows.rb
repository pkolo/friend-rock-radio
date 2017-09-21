class CreateJoinTableUsersShows < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :shows do |t|
      # t.index [:user_id, :show_id]
      # t.index [:show_id, :user_id]
    end
  end
end
