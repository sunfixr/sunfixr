require 'rails_helper'

RSpec.describe "api/v1/companies/new", :type => :view do
  before(:each) do
    assign(:company, build(:company, address: build(:address, country_id: nil, state: nil)))
    render
  end

  describe "new company form" do

    it "should have a form" do
      assert_select "form[action=?][method=?]", api_v1_companies_path, "post"
    end

    it "should have a name input" do
      assert_select "input#company_name[name=?]", "company[name]"
    end

    it "should have a company notes input" do
      assert_select "textarea#company_notes[name=?]", "company[notes]"
    end

    it "should have a created at input input that is disabled" do
      assert_select "input#company_created_at[name=?][disabled=?]", "company[created_at]", 'disabled'
    end


    it "should have a updated_at input that is disabled" do
      assert_select "input#company_updated_at[name=?][disabled=?]", "company[updated_at]", 'disabled'
    end

    it "should have an address 1 input" do
      assert_select "input#company_address_attributes_address1[name=?]", "company[address_attributes][address1]"
    end

    it "should have an address 2 input" do
      assert_select "input#company_address_attributes_address2[name=?]", "company[address_attributes][address2]"
    end

    it "should have a city input" do
      assert_select "input#company_address_attributes_city[name=?]", "company[address_attributes][city]"
    end

    it "should have a state input that is disabled" do
      assert_select "select#company_address_attributes_state[name=?][disabled=?]", "company[address_attributes][state]", 'disabled'
    end

    it "should have a postal code input" do
      assert_select "input#company_address_attributes_postal_code[name=?]", "company[address_attributes][postal_code]"
    end

    it "should have a country select box" do
      assert_select "select#company_address_attributes_country_id[name=?]", "company[address_attributes][country_id]"
    end

    it "should have a prompt for the country select box" do
      assert_select "select#company_address_attributes_country_id" do |country|
        assert_select country, 'option:first-child',  'Select A Country'
      end
    end


    it "should have a Latitude input." do
      assert_select "input#company_address_attributes_latitude[name=?]", "company[address_attributes][latitude]"
    end

    it "should have a longitude input." do
      assert_select "input#company_address_attributes_longitude[name=?]", "company[address_attributes][longitude]"
    end




  end
end
