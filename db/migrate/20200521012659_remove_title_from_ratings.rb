class RemoveTitleFromRatings < ActiveRecord::Migration[6.0]
  def change
    remove_column :ratings, :title, :string
  end
end
