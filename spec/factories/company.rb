FactoryGirl.define do
  factory :company do |f|
    f.name "Universal Studios"
    f.association :address, factory: :address
    f.components {|c| [c.association(:component)]}
    before(:create) do |company|
    #  company.projects << create(:project)
    end
  end

end