require 'rails_helper'

RSpec.describe "api/v1/components/show", :type => :view do
  let(:company) {create :company}
  before(:each) do
    @component = assign(:component, Component.create!(
      :name => "Name",
      :company_id => company.id,
      :part_number => "Part Number",
      :serial_number => "Serial Number"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/#{company.id.to_s}/)
    expect(rendered).to match(/Part Number/)
    expect(rendered).to match(/Serial Number/)
  end
end
