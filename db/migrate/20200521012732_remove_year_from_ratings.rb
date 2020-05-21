class RemoveYearFromRatings < ActiveRecord::Migration[6.0]
  def change
    remove_column :ratings, :year, :integer
  end
end
