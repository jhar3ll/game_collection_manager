class RemoveGenreFromGames < ActiveRecord::Migration[6.0]
  def change
    remove_column :games, :genre, :string
  end
end
