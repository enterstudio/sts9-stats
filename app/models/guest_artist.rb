class GuestArtist < ActiveRecord::Base
  belongs_to :artist
  belongs_to :show_set_song
end
