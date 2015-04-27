require 'rails_helper'

RSpec.describe "installations/new", :type => :view do
  before(:each) do
    assign(:installation, Installation.new(
      :name => "MyString",
      :slug => "MyString"
    ))
  end

  it "renders new installation form" do
    render

    assert_select "form[action=?][method=?]", installations_path, "post" do

      assert_select "input#installation_name[name=?]", "installation[name]"

      assert_select "input#installation_slug[name=?]", "installation[slug]"
    end
  end
end
