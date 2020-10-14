class Blog < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :comments
  has_many :users, through: :comments
  validates :title, :content, presence: true

  scope :alpha, -> { order(:title) }
  scope :most_comments, -> {left_joins(:comments).group('blogs.id').order('count(comments.blog_id) desc')}

  def city_attributes=(attr)
    self.city = City.find_or_create_by(attr) if !attr[:name].blank?
  end

end
