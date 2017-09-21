class Band < ApplicationRecord
  has_and_belongs_to_many :tracks
  belongs_to :location

  validates :name, presence: true
end
