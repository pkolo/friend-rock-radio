class User < ApplicationRecord
  has_secure_password

  validates :name, :password, presence: true
  validates :password, length: { in: 8..20 }
end
