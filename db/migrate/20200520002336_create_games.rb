class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :genre
      t.string :description
      t.belongs_to :console, null: false, foreign_key: true

      t.timestamps
    end
  end
end
