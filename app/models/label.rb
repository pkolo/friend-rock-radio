class Label < ApplicationRecord
  has_and_belongs_to_many :tracks
  has_many :bands, through: :tracks
  has_many :genres, through: :tracks

  validates :name, presence: true
end
