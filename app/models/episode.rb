class Episode < ApplicationRecord
  belongs_to :show
  has_and_belongs_to_many :hosts, class_name: 'User'

  validates :title, presence: true
end
