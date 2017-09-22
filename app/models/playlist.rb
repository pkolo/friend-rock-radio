class Playlist < ApplicationRecord
  belongs_to :episode
  belongs_to :track

  accepts_nested_attributes_for :track
end
