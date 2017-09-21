class Playlist < ApplicationRecord
  belongs_to :episode
  belongs_to :track
end
