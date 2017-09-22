class Episode < ApplicationRecord
  belongs_to :show
  has_and_belongs_to_many :hosts, class_name: 'User'
  has_many :playlists, dependent: :destroy
  has_many :tracks, through: :playlists
  has_many :bands, through: :tracks
  has_many :genres, through: :tracks
  has_many :labels, through: :tracks

  validates :title, presence: true

  accepts_nested_attributes_for :playlists
end
