require 'rails_helper'

RSpec.describe "api/v1/addresses/show", :type => :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      :name => "Name",
      :address1 => "Address1",
      :address2 => "Address2",
      :city => "City",
      :state => "KW",
      :postal_code => "Postal Code",
      :country_id => "CD",
      :latitude => "Latitude",
      :longitude => "Longitude"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address1/)
    expect(rendered).to match(/Address2/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Kasai-Occidental/)
    expect(rendered).to match(/Postal Code/)
    expect(rendered).to match(/Congo, The Democratic Republic Of The/)
    expect(rendered).to match(/Latitude/)
    expect(rendered).to match(/Longitude/)
  end
end
