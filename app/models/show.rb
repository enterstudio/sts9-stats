class Show < ActiveRecord::Base
  has_many :show_sets
  belongs_to :venue
end
