class CreateShowSetSongs < ActiveRecord::Migration
  def change
    create_table :show_set_songs do |t|
      t.references :show_set, index: true
      t.references :song, index: true
      t.time :length
      t.integer :order

      t.timestamps
    end
  end
end
