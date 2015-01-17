class ShowSong < ActiveRecord::Base
  belongs_to :show_set
  belongs_to :song
  has_many :show_song_notes
  has_many :song_notes, through: :show_song_notes
end
