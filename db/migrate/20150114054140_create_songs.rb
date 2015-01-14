class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.text :description
      t.boolean :is_cover
      t.string :original_artist

      t.timestamps
    end
  end
end
