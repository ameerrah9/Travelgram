require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
City.destroy_all
Blog.destroy_all
Comment.destroy_all


100.times do
  User.create(
      username: Faker::Name.name,
      email: Faker::Internet.email,
      password: Faker::Internet.password)
end

100.times do
  City.create(name: Faker::Address.city)
end

100.times do
  Blog.create(
      title: Faker::Quote.singular_siegler,
      content: Faker::Quote.robin,
      user_id: User.all.sample.id,
      city_id: City.all.sample.id)
end

100.times do
  Comment.create(
      content: Faker::Quote.robin,
      user_id: User.all.sample.id,
      blog_id: Blog.all.sample.id)
end
