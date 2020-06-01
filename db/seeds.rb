# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Item.destroy_all

# Seed Item
5.times do
  Item.create!(
    title: Faker::Creature::Cat.name,
    price: Faker::Number.decimal(l_digits: 2),
    image_url: Faker::Internet.url(host: 'chatons.com'),
    description: Faker::Hipster.sentence(word_count: 3)
  )
end

