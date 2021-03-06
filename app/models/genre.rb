class Genre < ApplicationRecord
  has_and_belongs_to_many :tracks
  has_many :bands, through: :tracks
  has_many :labels, through: :tracks

  validates :name, presence: true
end
