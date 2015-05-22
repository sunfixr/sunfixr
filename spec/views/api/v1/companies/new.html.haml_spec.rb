require 'rails_helper'

RSpec.describe "api/v1/companies/new", :type => :view do
  before(:each) do
    assign(:company, Company.new(
      :name => "MyString"
    ))
  end

  it "renders new company form" do
    render

    assert_select "form[action=?][method=?]", api_v1_companies_path, "post" do

      assert_select "input#company_name[name=?]", "company[name]"
    end
  end
end
