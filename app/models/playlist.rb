class Playlist < ApplicationRecord
  belongs_to :episode
  belongs_to :track, optional: true

  validates :track, presence: true

  accepts_nested_attributes_for :track
end
