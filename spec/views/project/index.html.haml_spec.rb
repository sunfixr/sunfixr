require 'rails_helper'

RSpec.describe "project/index", :type => :view do
  let(:projects){create_pair(:project)}
  before(:each) do
    assign(:projects, projects)
  end

  it "renders a list of projects" do
    render
    assert_select "h4", :text => "Foo 1".to_s, :count => 2
  end
  it "has the proper path to the project index page" do
    render
    assert_select('a[href=?]', 'project/' + projects[0].slug) do |elements|
      expect(elements.count).to eq 1
    end
  end
end
