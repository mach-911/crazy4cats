# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

i = 0
until User.count == 20 do
  User.create(
    email: "test_user#{i}@gmail.com", 
    password: "asdfasdf", 
    password_confirmation: "asdfasdf")
  i += 1
end

users = User.all

until Publication.count == 20 do
    Publication.create(
        title: Faker::Book.title, 
        content: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false),
        banner: Faker::LoremFlickr.image(size: "800x600", search_terms: ['sports', 'fitness']),
        user_id: users.sample.id
    )
end

publications = Publication.all
kinds = %w[like dislike]

until Reaction.count == 100 do
    Reaction.create(publication_id: publications.sample.id, user_id: users.sample.id, kind: kinds.sample)
end