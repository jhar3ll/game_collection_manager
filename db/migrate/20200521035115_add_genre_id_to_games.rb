class AddGenreIdToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :genre_id, :integer
  end
end
