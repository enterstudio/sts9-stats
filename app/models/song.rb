class Song < ActiveRecord::Base
  has_many :show_songs
  has_many :shows, through: :show_songs
  belongs_to :artist
end
