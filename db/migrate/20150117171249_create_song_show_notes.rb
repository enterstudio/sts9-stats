class CreateSongShowNotes < ActiveRecord::Migration
  def change
    create_table :song_show_notes do |t|
      t.references :show_song, index: true
      t.references :song_note, index: true
      t.string :description
      t.references :related, polymorphic: true, index: true

      t.timestamps
    end
  end
end
