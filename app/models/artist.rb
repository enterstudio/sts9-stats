class Artist < ActiveRecord::Base
  has_many :songs
  # polymorphic for sit-ins
  has_many :show_song_notes, as: :related
end
