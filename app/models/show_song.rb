class ShowSetSong < ActiveRecord::Base
  belongs_to :show_set
  belongs_to :song
  has_many :artists, though: :guest_artist
end
