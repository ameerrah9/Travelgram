class User < ApplicationRecord
  has_many :trips
  has_many :comments
  has_many :commented_trips, through: :comments,
    source: :trip
  has_secure_password
  #has_many :cities, through :trips
end
