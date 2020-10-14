Traveler App

 Blog *join table cities & users
    - belongs_to :user
    - has_many :comments
    - has_many :users through :comments
    - belongs_to :city
    - title
    - content
    
User (Traveler)
    - has_many :trips
    - has_many :comments
    - has_many :commented_blogs through :comments
    - has_many :cities, through :blogs
    - username
    - password_digest
    - email


Comment *join table users & blogs
    - belongs_to :user
    - belongs_to :blogs
    - content
    
Cities (Catergories)
    - name
    - has_many :blogs
    - has_many :users, through :blogs
    