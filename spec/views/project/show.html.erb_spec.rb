require 'rails_helper'

RSpec.describe "project/show", :type => :view do
  login_user
  before(:each) do

    @project = assign(:project,
                           build(:project, id: 123, name: 'project 1', slug: 'install1',
                                 company: build(:company),
                                 components: [build(:component),build(:component)] )

                     )
    render
  end

  it "should display the name" do
    expect(rendered).to match /project 1/
  end

  it "should display the city" do
    expect(rendered).to match(@project.address.city)
  end

  it "should display the state" do
    expect(rendered).to match(@project.address.state_name)
  end

  it "should display the country" do
    expect(rendered).to match(@project.address.country_name)
  end

  it "should display the description" do
    expect(rendered).to match(@project.description)
  end

  it "should display the company" do
    expect(rendered).to match(@project.company.name)
  end

  it "should display the install date" do
    expect(rendered).to match(@project.install_date.to_s)
  end

  it "should display the components" do
    expect(rendered).to match(@project.components[1].name)
  end

  it "should display a link to the maintenance log" do
    assert_select 'a#maintenance-log-link[href="#"]'
  end

  it "should display a link to the files listing page" do
    assert_select 'a#attachments-link[href="/project/install1/attachments/list"]'
  end
end

