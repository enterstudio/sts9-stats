class SongShowNote < ActiveRecord::Base
  belongs_to :show_song
  belongs_to :song_note
  belongs_to :related, polymorphic: true
end
