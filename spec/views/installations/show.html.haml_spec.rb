require 'rails_helper'

RSpec.describe "installations/show", :type => :view do
  before(:each) do
    @installation = assign(:installation, Installation.create!(
      :name => "Name",
      :slug => "Slug"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Slug/)
  end
end
