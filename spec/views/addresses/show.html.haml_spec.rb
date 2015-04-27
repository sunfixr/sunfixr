require 'rails_helper'

RSpec.describe "addresses/show", :type => :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      :name => "Name",
      :address1 => "Address1",
      :address2 => "Address2",
      :city => "City",
      :state => "State",
      :postal_code => "Postal Code",
      :country_id => "Country",
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
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Postal Code/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/Latitude/)
    expect(rendered).to match(/Longitude/)
  end
end
