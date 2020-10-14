class User < ApplicationRecord
  has_many :blogs
  has_many :comments
  has_many :commented_trips, through: :comments,
    source: :blog
  has_secure_password
  has_many :cities, through: :blogs

  validates :email, :username, presence: true

end
