class CreatePlatforms < ActiveRecord::Migration[6.0]
  def change
    create_table :platforms do |t|
      t.string :name
      t.boolean :cross_platform_compatible

      t.timestamps null: false
    end
  end
end
