class ShowSet < ActiveRecord::Base
  belongs_to :show
  has_many :show_songs
end
