class Track < ApplicationRecord
  has_and_belongs_to_many :genres
  
  validates :title, presence: true
end
