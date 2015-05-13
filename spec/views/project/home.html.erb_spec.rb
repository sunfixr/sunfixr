require 'rails_helper'

RSpec.describe "project/home", :type => :view do
  before(:each) do
    @installation = assign(:installation,
                           build(:installation, name: 'installation 1', slug: 'install1',
                                 company: build(:company),
                                 components: [build(:component),build(:component)] )

                     )
    render
  end

  it "should display the name" do
    expect(rendered).to match /installation 1/
  end

  it "should display the city" do
    expect(rendered).to match(@installation.address.city)
  end

  it "should display the state" do
    expect(rendered).to match(@installation.address.state)
  end

  it "should display the country" do
    expect(rendered).to match(@installation.address.country_name)
  end

  it "should display the description" do
    expect(rendered).to match(@installation.description)
  end

  it "should display the company" do
    expect(rendered).to match(@installation.company.name)
  end

  it "should display the install date" do
    expect(rendered).to match(@installation.install_date.to_s)
  end

  it "should display the components" do
    expect(rendered).to match(@installation.components[1].name)
  end
end

