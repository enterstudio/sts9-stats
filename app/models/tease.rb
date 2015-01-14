class Tease < ActiveRecord::Base
  belongs_to :song
  belongs_to :show_set_song
end
