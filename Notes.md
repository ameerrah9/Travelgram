Traveler App

Post (Trip) *join table cities & users
    - belongs_to :user
    - has_many :comments
    - has_many :users through :comments
    - belongs_to :city
    - destination (title)
    - content
    
User (Traveler)
    - has_many :trips
    - has_many :comments
    - has_many :commented_trips through :comments
    - has_many :cities, through :trips
    - username
    - password_digest
    - email


Comment *join table users & trips
    - belongs_to :user
    - belongs_to :trips
    - content
    
Cities (Catergories)
    - name
    - has_many :trips
    - has_many :users, through :trips
    