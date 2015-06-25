require 'rails_helper'

RSpec.describe "api/v1/projects/new", :type => :view do
  before(:each) do
    @project = assign(:project, build(:project,
      :name => "MyString",
      :slug => "MyString",
      project_pics: [build(:project_pic),build(:project_pic)]
    ))
  end

  it "renders new project form" do
    render
    assert_select "form[action=?][method=?]", api_v1_projects_path, "post" do

      assert_select "input#project_name[name=?]", "project[name]"

      assert_select "input#project_slug[name=?]", "project[slug]"
    end
  end
end
