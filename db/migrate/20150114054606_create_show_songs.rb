class CreateShowSongs < ActiveRecord::Migration
  def change
    create_table :show_songs do |t|
      t.references :show, index: true
      t.references :song, index: true
      t.string :segue_in
      t.string :segue_out
      t.boolean :unfinished
      t.time :length

      t.timestamps
    end
  end
end
