require 'rails_helper'

RSpec.describe "components/index", :type => :view do
  let(:company) {create :company}
  before(:each) do
    assign(:components, [
      Component.create!(
        :name => "Name",
        :company_id => company.id,
        :part_number => "Part Number",
        :serial_number => "Serial Number"
      ),
      Component.create!(
        :name => "Name",
        :company_id => company.id,
        :part_number => "Part Number",
        :serial_number => "Serial Number"
      )
    ])
  end

  it "renders a list of components" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "#{company.id}".to_s, :count => 2
    assert_select "tr>td", :text => "Part Number".to_s, :count => 2
    assert_select "tr>td", :text => "Serial Number".to_s, :count => 2
  end
end
