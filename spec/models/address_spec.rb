require 'rails_helper'

RSpec.describe Address, :type => :model do
  subject(:address){FactoryGirl.create(:address)}
  it{should be_valid}
  it{should respond_to(:name)}
  it{should respond_to(:address1)}
  it{should respond_to(:address2)}
  it{should respond_to(:city)}
  it{should respond_to(:state)}
  it{should respond_to(:postal_code)}
  it{should respond_to(:country_id)}
  it{should respond_to(:latitude)}
  it{should respond_to(:longitude)}

  context "missing name" do
    before{address.name=''}
    it{should_not be_valid}
  end

  it "should return the country name" do
    expect(address.country_name).to eq "United States"
  end

  it "should return the state name" do
    expect(address.state_name).to eq "California"
  end

end
