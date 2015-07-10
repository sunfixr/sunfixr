FactoryGirl.define do
  factory :address do |f|
    f.name "Herman Munster"
    f.address1 "1313 Mockingbird ln"
    f.address2 nil
    f.city "Hollywood"
    f.state "CA"
    f.postal_code "90210"
    f.latitude 34.101001
    f.longitude -118.343301
    f.country_id "US"
  end

end