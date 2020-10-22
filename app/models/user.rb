class User < ApplicationRecord
  has_many :blogs, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :commented_trips, through: :comments,
    source: :blog
  has_secure_password
  has_many :cities, through: :blogs

  validates :email, :username, presence: true, uniqueness: true
  validates :username, uniqueness: true

end
