require 'rails_helper'

RSpec.describe ComponentType, :type => :model do
  subject(:component_type) {create(:component_type)}
  it {should be_valid}
  describe "when we add a blank name" do
    before {component_type.name = ''}
    it{should_not be_valid}
  end
end
