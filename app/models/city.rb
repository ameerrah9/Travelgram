class City < ApplicationRecord
  has_many :blogs
  has_many :users, through: :blogs

  validates :name, presence: true

  def to_s
    name
  end
end
