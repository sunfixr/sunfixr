require 'rails_helper'
RSpec.describe "project_pics", :type => :view do
  login_user
  before :each do
    @project = create(:project, project_pics: [create(:project_pic),create(:project_pic)])
    assign(:project, @project)
  end

  it "should display a picture" do
    render(:template => "project/project_pics/index.html.haml")
    assert_select ".row .col-sm-4>a", :text => "Destroy".to_s, :count => 2
  end

end