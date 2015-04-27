FactoryGirl.define do
  factory :installation do |f|
    f.name "Foo 1"
    f.slug {Faker::Internet.slug}
    f.association :address, factory: :address
    f.posts {|c| [c.association(:post)]}
    before(:create) do |installation|
      installation.company = create(:company)
      installation.components << create(:component)
    end
  end


end