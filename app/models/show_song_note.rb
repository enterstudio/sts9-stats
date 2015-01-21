class ShowSongNote < ActiveRecord::Base
  # These are show-specific instance of "SongNotes" that can be attached to a ShowSong
  # ex. 'Sit In', if a song from a specific show has a sit in, attach a SongNote
  # of type 'SitIn' using a ShowSongNote  
  belongs_to :show_song
  belongs_to :song_note
  # Polymorphic 'related' is for associating a sit-in artist, tease Song, etc
  belongs_to :related, polymorphic: true
end
