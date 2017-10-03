class Playlist < ApplicationRecord
  belongs_to :episode
  belongs_to :track, optional: true

  validates :time_marker, presence: true

  accepts_nested_attributes_for :track

  scope :play_order, -> { order('time_marker asc') }

  def pretty_time
    seconds = time_marker % 60
    minutes = (time_marker - seconds) / 60
    "#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')}"
  end
end
