require 'rails_helper'

RSpec.describe "projects/index", :type => :view do
  let(:projects){create_pair(:project)}
  before(:each) do
    assign(:projects, projects)
  end

  it "renders a list of projects" do
    render
    assert_select "li>a", :text => "Foo 1".to_s, :count => 2
  end
end
