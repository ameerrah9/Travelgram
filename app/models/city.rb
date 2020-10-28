class City < ApplicationRecord
  has_many :blogs
  has_many :users, through: :blogs

  validates :name, presence: true

  scope :by_name, -> { order(name: :asc) }

  def to_s
    name
  end
end
