FactoryGirl.define do
  factory :user do |f|
    f.password { Faker::Internet.password }
    f.email { Faker::Internet.email }
  end

end
