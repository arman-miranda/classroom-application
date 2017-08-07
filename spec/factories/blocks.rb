FactoryGirl.define do
  factory :block do
    sequence(:name, 'A') { |n| "CS-" + n } 
    year_level 1
  end
end
