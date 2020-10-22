class Blog < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments
  validates :title, :content, presence: true
  validates :city, presence: true
  validate :too_many_blogs

  def self.search(params)
    where("LOWER(title) LIKE ?", "%#{params}%")
  end

  scope :most_comments, -> {left_joins(:comments).group('blogs.id').order('count(comments.blog_id) desc')}

  def city_attributes=(attr)
    self.city = City.find_or_create_by(attr) if !attr[:name].blank?

  end

  def too_many_blogs
    blogs_of_today = user.blogs.select do |b|
      b.created_at.try(:to_date) == Date.today
    end
    if blogs_of_today.size > 5
      errors.add(:blog_id, "too many blogs today")
    end
  end
end
