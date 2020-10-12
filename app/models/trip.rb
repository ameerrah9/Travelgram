class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :comments
  has_many :users, through: :comments
end
