require 'rails_helper'

RSpec.describe "addresses/edit", :type => :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      :name => "MyString",
      :address1 => "MyString",
      :address2 => "MyString",
      :city => "MyString",
      :state => "MyString",
      :postal_code => "MyString",
      :country_id => "MyString",
      :latitude => "MyString",
      :longitude => "MyString"
    ))
  end

  it "renders the edit address form" do
    render

    assert_select "form[action=?][method=?]", address_path(@address), "post" do

      assert_select "input#address_name[name=?]", "address[name]"

      assert_select "input#address_address1[name=?]", "address[address1]"

      assert_select "input#address_address2[name=?]", "address[address2]"

      assert_select "input#address_city[name=?]", "address[city]"

      assert_select "input#address_state[name=?]", "address[state]"

      assert_select "input#address_postal_code[name=?]", "address[postal_code]"

      assert_select "select#address_country_id[name=?]", "address[country_id]"

      assert_select "input#address_latitude[name=?]", "address[latitude]"

      assert_select "input#address_longitude[name=?]", "address[longitude]"
    end
  end
end
