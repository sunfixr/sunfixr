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

    trait :with_project_pics do
      after(:create){|project|  project.project_pics = create_pair(:project_pic, project_id: project.id)}
    end

    trait :with_attachments do
      after(:create){|project|  project.attachments = create_pair(:attachment)}
    end

    trait :with_users do
      after(:create){|project|  project.users = create_pair(:user)}
    end

    factory :project_with_company, traits: [:with_company]
    factory :project_with_components, traits: [:with_components]
    factory :project_with_project_pics, traits: [:with_company, :with_project_pics]
    factory :project_with_attachments, traits: [:with_company, :with_attachments]
    factory :project_with_users, traits: [:with_users]
  end


end