FactoryGirl.define do
  factory :component do |c|
    c.name {Faker::Commerce.product_name}
    c.description {Faker::Lorem.sentence}
    component_type
    c.part_number {Faker::Number.number(10)}
    c.serial_number {Faker::Number.number(10)}
  end

end