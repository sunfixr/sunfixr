require 'rails_helper'

RSpec.describe "installations/show", :type => :view do
  before(:each) do
    @installation = assign(:installation, create(:installation))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@installation.name}/)
    expect(rendered).to match(/#{@installation.slug}/)
    expect(rendered).to match(/#{@installation.description}/)
  end
end
