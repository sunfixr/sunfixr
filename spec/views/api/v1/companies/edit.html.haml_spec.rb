require 'rails_helper'

RSpec.describe "api/v1/companies/edit", :type => :view do
  before(:each) do
    @company = assign(:company, Company.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit company form" do
    render

    assert_select "form[action=?][method=?]", api_v1_company_path(@company), "post" do

      assert_select "input#company_name[name=?]", "company[name]"
    end
  end
end
