require 'rails_helper'

RSpec.describe "api/v1/companies/show", :type => :view do
  before(:each) do
    @company = assign(:company, Company.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
