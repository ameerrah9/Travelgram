# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

user1 = User.create(username: "Mark", email: "mark@mail.com", password: "password")
user2 = User.create(username: "Imani", email: "imani@mail.com", password: "password")
user3 = User.create(username: "Ben", email: "ben@mail.com", password: "password")
user4 = User.create(username: "Billy", email: "billy@mail.com", password: "password")
user5 = User.create(username: "Will", email: "will@mail.com", password: "password")

city1 = City.create(name: "Los Angeles")
city2 = City.create(name: "New York")
city3 = City.create(name: "Italy")
city4 = City.create(name: "Tunis")
city5 = City.create(name: "Warsaw")

trip1 = Blog.create(destination: "Virgin Islands", content: "Beautiful", user_id: User.all.sample.id, city_id: city2.id)
trip2 = Blog.create(destination: "French Riviera", content: "Beautiful", user_id: User.all.sample.id, city_id: city3.id)
trip3 = Blog.create(destination: "Petrified Forest", content: "Beautiful", user_id: user5.id, city_id: city5.id)
trip4 = Blog.create(destination: "Universal's Islands of Adventure", content: "So fun", user_id: user3.id, city_id: city1.id)
trip5 = Blog.create(destination: "Walt Disney World", content: "Had a blast", user_id: user3.id, city_id: city4.id)

comment1 = Comment.create(content: "Glad you had a good time", user_id: user1.id, trip_id: trip2.id)
comment2 = Comment.create(content: "Glad you had a fun time", user_id: user3.id, trip_id: trip1.id)
comment3 = Comment.create(content: "Glad you had a good time", user_id: user4.id, trip_id: trip4.id)
comment4 = Comment.create(content: "Glad you had a good time", user_id: user2.id, trip_id: trip3.id)
comment5 = Comment.create(content: "Wow!", user_id: user5.id, trip_id: trip5.id)