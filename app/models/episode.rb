class Episode < ApplicationRecord
  belongs_to :show
  has_and_belongs_to_many :hosts, class_name: 'User'
  has_many :playlists
  has_many :tracks, through: :playlists

  validates :title, presence: true
end
