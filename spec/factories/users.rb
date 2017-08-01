FactoryGirl.define do
  factory :user do |f|
     f.email      "sample@sample.com"
     f.password   "password"
     f.first_name "John"
     f.last_name  "Doe"
     f.birthdate  "June 25, 1997"
     f.address    "123 EZ St."
  end
end
