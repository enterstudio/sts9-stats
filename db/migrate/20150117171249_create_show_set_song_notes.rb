class CreateShowSetSongNotes < ActiveRecord::Migration
  def change
    create_table :show_set_song_notes do |t|
      t.references :show_set_song, index: true
      t.references :song_note, index: true
      t.string :description
      t.references :related, polymorphic: true, index: true

      t.timestamps
    end
  end
end
