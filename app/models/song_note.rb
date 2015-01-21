class SongNote < ActiveRecord::Base
  # These are specific "Notes" that can be attached to a ShowSong
  # ex. 'Sit In', if a song from a specific show has a sit in, attach a SongNote
  # of type 'SitIn' using a ShowSongNote
  has_many :show_song_notes
end
