class Playlist < ApplicationRecord
  belongs_to :episode
  belongs_to :track, optional: true

  validates :track, presence: true
  validates :time_marker, presence: true

  accepts_nested_attributes_for :track
end
