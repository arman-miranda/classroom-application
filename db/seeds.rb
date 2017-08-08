# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Subject.delete_all
Block.delete_all

#Create a admin account
User.create!(
  first_name: 'Admin',
  last_name:  'Admin',
  email: 'admin@sample.com',
  password: 'password',
  birthdate: 'June 2, 1995',
).add_role :admin

#Create teacher accounts
10.times do |i|
  User.create!(
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    email:      Faker::Internet.email,
    password:   "password",
    birthdate:  Faker::Date.birthday(18, 65)
  ).add_role :teacher
end

#Create student accounts
10.times do |i|
  User.create!(
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    email:      Faker::Internet.email,
    password:   "password",
    birthdate:  Faker::Date.birthday(18,65)
  ).add_role :student
end

#Create Subjects
10.times do |i|
  Subject.create!(
    name:       Faker::Job.field
  )
end

#Create Blocks
4.times do |i|
  ('A'..'B').map do |a|
    Block.create!(
      name: "CS-#{a}",
      year_level: i + 1
    )
  end
end
