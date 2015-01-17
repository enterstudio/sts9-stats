class CreateSongNotes < ActiveRecord::Migration
  def change
    create_table :song_notes do |t|
      t.string :name

      t.timestamps
    end
  end
end
