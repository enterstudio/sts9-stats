class CreateGuestArtists < ActiveRecord::Migration
  def change
    create_table :guest_artists do |t|
      t.references :artist, index: true
      t.references :show_set_song, index: true

      t.timestamps
    end
  end
end
