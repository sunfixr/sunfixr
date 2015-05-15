FactoryGirl.define do
  factory :project do |f|
    f.name "Foo 1"
    f.slug {Faker::Internet.slug}
    f.description{Faker::Lorem.sentence}
    f.install_date{Faker::Date.backward(14)}

    trait :with_address do
      f.association :address, factory: :address
    end

    trait :with_company do
      after(:create){|project| project.company = create(:company)}
    end

    trait :with_components do
      after(:create){|project|  project.components = create_pair(:component)}
    end

  end


end