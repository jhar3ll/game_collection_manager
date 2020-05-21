class AddContentToRatings < ActiveRecord::Migration[6.0]
  def change
    add_column :ratings, :content, :string
  end
end
