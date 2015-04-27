FactoryGirl.define do
  factory :post do |f|
    f.screen_name {Faker::Internet.user_name}
    f.subject {Faker::Lorem.sentence}
    f.post_text {Faker::Lorem.paragraph}
  end

end