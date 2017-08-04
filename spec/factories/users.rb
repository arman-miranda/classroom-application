FactoryGirl.define do
  factory :user do |f|
     f.email      "sample@sample.com"
     f.password   "password"
     f.first_name "John"
     f.last_name  "Doe"
     f.birthdate  "June 25, 1997"
     f.address    "123 EZ St."
  end

  factory :admin, parent: :user do
    after :build { |user| user.add_role :admin }
  end
  
  factory :teacher, parent: :user do
    after :build { |user| user.add_role :teacher }
    after :create { |user| user.add_role :teacher }
  end
  
  factory :student, parent: :user do
    after :build { |user| user.add_role :student }
  end
end
