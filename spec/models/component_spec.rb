require 'rails_helper'

RSpec.describe Component, :type => :model do
  subject(:component) {create(:component, company: create(:company,components: []))}
  it {should be_valid}
  describe "when we add a blank name" do
    before {component.name = ''}
    it{should_not be_valid}
  end

  describe "Associations" do
    it "should have a valid component_type" do
      expect(component.component_type.name).to eq "Solar Panel"
    end

    it "should have a valid company" do
      expect(component.company.name).to eq "Universal Studios"
    end
  end

end
