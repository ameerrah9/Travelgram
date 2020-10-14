class City < ApplicationRecord
  has_many :blogs
  has_many :users, through: :blogs

  validates :name, presence: true

end
