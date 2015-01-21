class Song < ActiveRecord::Base
  has_many :show_songs
  has_many :shows, through: :show_songs
  # polymorphic for teases
  has_many :show_song_notes, as: :related
  belongs_to :artist
end
