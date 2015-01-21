class Show < ActiveRecord::Base
  has_many :show_sets
  has_many :songs, through: :show_sets
  belongs_to :venue
end
