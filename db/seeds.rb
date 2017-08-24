Teacher.delete_all
Student.delete_all
User.delete_all
Subject.delete_all
Block.delete_all

#Create a admin account
admin = User.create(
  first_name: 'Admin',
  last_name:  'Admin',
  email: 'admin@sample.com',
  password: 'password',
  birthdate: 'June 2, 1995',
  confirmed_at: Time.now
).add_role :admin

admin.save!

10.times do |i|
  #Create Teacher accounts
  teacher = User.create(
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    email:      Faker::Internet.unique.email,
    password:   "password",
    birthdate:  Faker::Date.birthday(18, 65),
    confirmed_at: Time.now
  ).add_role :teacher
  
  teacher.save!
  

  #Create Student accounts
  student = User.create(
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    email:      Faker::Internet.unique.email,
    password:   "password",
    birthdate:  Faker::Date.birthday(18,65),
    confirmed_at: Time.now
  ).add_role :student

  student.save!
  
  #Create Subjects
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

#Assign Advisory Teacher and Subjects to blocks
Block.all.each do |block|
  block.subjects << Subject.all.uniq.sample(5)
end
