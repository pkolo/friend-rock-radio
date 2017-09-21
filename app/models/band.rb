class Band < ApplicationRecord
  belongs_to :location
  has_and_belongs_to_many :tracks
  has_many :genres, through: :tracks
  has_many :labels, through: :tracks
  has_many :plays, through: :tracks
  has_many :episodes_played_on, through: :plays, source: :episode

  validates :name, presence: true
end
