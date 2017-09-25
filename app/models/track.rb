class Track < ApplicationRecord
  has_and_belongs_to_many :bands
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :labels
  has_many :plays, class_name: 'Playlist'
  has_many :episodes_played_on, through: :plays, source: :episode

  validates :title, :year, presence: true
  validates :year, inclusion: 1900..(Time.now.year + 1)

  accepts_nested_attributes_for :bands
  accepts_nested_attributes_for :genres
  accepts_nested_attributes_for :labels
end
