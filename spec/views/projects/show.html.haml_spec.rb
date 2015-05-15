require 'rails_helper'

RSpec.describe "projects/show", :type => :view do
  before(:each) do
    @project = assign(:project, create(:project))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@project.name}/)
    expect(rendered).to match(/#{@project.slug}/)
    expect(rendered).to match(/#{@project.description}/)
  end
end
