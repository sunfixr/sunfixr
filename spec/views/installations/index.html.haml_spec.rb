require 'rails_helper'

RSpec.describe "installations/index", :type => :view do
  before(:each) do
    assign(:installations, [
      Installation.create!(
        :name => "Name",
        :slug => "slug"
      ),
      Installation.create!(
        :name => "Name",
        :slug => "slug2"
      )
    ])
  end

  it "renders a list of installations" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "slug".to_s, :count => 1
    assert_select "tr>td", :text => "slug2".to_s, :count => 1
  end
end
