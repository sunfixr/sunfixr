require 'rails_helper'

RSpec.describe "api/v1/companies/index", :type => :view do
  before(:each) do
    assign(:companies, [
      Company.create!(
        :name => "Name"
      ),
      Company.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of companies" do
    render
    assert_select "div.admin-row", :text => "Name".to_s, :count => 2
  end
end
