class Show < ApplicationRecord
  has_and_belongs_to_many :hosts, class_name: 'User'
end
