require 'rails_helper'

RSpec.describe "api/v1/projects/edit", :type => :view do
  before(:each) do
    @project = assign(:project, create(:project, project_pics: [create(:project_pic),create(:project_pic)]))
  end

  it "renders the edit project form" do
    render

    assert_select "form[action=?][method=?]", api_v1_project_path(@project), "post" do

      assert_select "input#project_name[name=?]", "project[name]"

      assert_select "input#project_slug[name=?]", "project[slug]"
    end
  end
end
