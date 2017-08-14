FactoryGirl.define do
  factory :user do |f|
     f.email      "sample@sample.com"
     f.password   "password"
     f.first_name "John"
     f.last_name  "Doe"
     f.birthdate  "June 25, 1997"
     f.address    "123 EZ St."
     teacher 
     student
  end

  factory :admin_role, parent: :user do
    sequence(:email) { |n| "admin#{n}@sample.com" }
    after :build { |user| user.add_role :admin }
  end
  
  factory :teacher_role, parent: :user do
    sequence(:email) { |n| "teacher#{n}@sample.com" }
    after :build { |user| user.add_role :teacher }
    after :create { |user| user.add_role :teacher }
  end
  
  factory :student_role, parent: :user do
    sequence(:email) { |n| "student#{n}@sample.com" }
    after :build { |user| user.add_role :student }
  end
end
