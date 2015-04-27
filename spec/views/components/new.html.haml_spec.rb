require 'rails_helper'

RSpec.describe "components/new", :type => :view do
  let(:company) {create :company}
  before(:each) do
    assign(:component, Component.new(
      :name => "MyString",
      :company_id => company.id,
      :part_number => "MyString",
      :serial_number => "MyString"
    ))
  end

  it "renders new component form" do
    render

    assert_select "form[action=?][method=?]", components_path, "post" do

      assert_select "input#component_name[name=?]", "component[name]"

      assert_select "input#component_company_id[name=?]", "component[company_id]"

      assert_select "input#component_part_number[name=?]", "component[part_number]"

      assert_select "input#component_serial_number[name=?]", "component[serial_number]"
    end
  end
end
