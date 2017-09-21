class User < ApplicationRecord
  has_secure_password

  has_and_belongs_to_many :shows

  validates :name, :password, presence: true
  validates :password, length: { in: 8..20 }
end
