class Track < ApplicationRecord
  has_and_belongs_to_many :bands
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :labels

  validates :title, presence: true
end
