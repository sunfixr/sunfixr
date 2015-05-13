require 'rails_helper'

RSpec.describe "installations/index", :type => :view do
  let(:installations){create_pair(:installation)}
  before(:each) do
    assign(:installations, installations)
  end

  it "renders a list of installations" do
    render
    assert_select "tr>td", :text => "Foo 1".to_s, :count => 2
    assert_select "tr>td", :text => installations[0].slug.to_s, :count => 1
    assert_select "tr>td", :text => installations[1].slug.to_s, :count => 1
  end
end
