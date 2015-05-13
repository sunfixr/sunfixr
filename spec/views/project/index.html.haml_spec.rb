require 'rails_helper'

RSpec.describe "project/index", :type => :view do
  before(:each) do
    create(:installation,
      name: 'installation 1'
    )
    create(:installation,
      name: 'installation 2',
    )
    @installations = assign(:installations, Installation.all)
  end
  it "should show all installations" do
    render
    expect(rendered).to match /installation 1/
    expect(rendered).to match /installation 2/
  end
end