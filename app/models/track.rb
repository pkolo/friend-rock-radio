class Track < ApplicationRecord
  has_and_belongs_to_many :bands
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :labels
  has_many :plays, class_name: 'Playlist'
  has_many :episodes_played_on, through: :plays, source: :episode

  validates :title, presence: true
end
