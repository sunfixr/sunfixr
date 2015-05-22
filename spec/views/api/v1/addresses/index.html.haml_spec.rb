require 'rails_helper'

RSpec.describe "api/v1/addresses/index", :type => :view do
  before(:each) do
    assign(:addresses, [
      Address.create!(
        :name => "Name",
        :address1 => "Address1",
        :address2 => "Address2",
        :city => "City",
        :state => "State",
        :postal_code => "Postal Code",
        :country_id => "Country",
        :latitude => 34.123456,
        :longitude => -112.123456
      ),
      Address.create!(
        :name => "Name",
        :address1 => "Address1",
        :address2 => "Address2",
        :city => "City",
        :state => "State",
        :postal_code => "Postal Code",
        :country_id => "Country",
        :latitude => 34.123456,
        :longitude => -112.123456
      )
    ])
  end

  it "renders a list of addresses" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address1".to_s, :count => 2
    assert_select "tr>td", :text => "Address2".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Postal Code".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "34.123456".to_s, :count => 2
    assert_select "tr>td", :text => "-112.123456".to_s, :count => 2
  end
end
