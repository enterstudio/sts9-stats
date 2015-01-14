class Artist < ActiveRecord::Base
  has_many :show_songs, through: :guest_artist
end
