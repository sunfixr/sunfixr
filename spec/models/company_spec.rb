require 'rails_helper'

RSpec.describe Company, :type => :model do
  subject(:company) {FactoryGirl.create(:company)}
  it {should respond_to(:name)}
  it {should be_valid}

  describe "when name is not present" do
    before { company.name = " " }
    it {should_not be_valid}
  end

  it {should respond_to(:address)}

  describe 'address' do
    before{company.address = FactoryGirl.build(:address, name: 'bogus name', address1: '2323 Bogus ln') }
    it{should respond_to(:address)}
    it "should have an address1" do
      expect(company.address.address1).to eq "2323 Bogus ln"
    end

    it "save the address" do
      expect(Address.find(company.address.id).address1).to eq '2323 Bogus ln'
    end

    it "should save the address relationship to the project" do
      company2 = Company.find(company.id)
      expect(company2.address).to eq company.address
    end

    it "should populate the address.name with the project name if blank" do
      company2 = Company.create({name: 'Company Name', address_attributes: {name: '',address1: 'some street'}})
      expect(company2.address.name).to eq 'Company Name'
    end

    it "should not change the address.name if set" do
      company2 = Project.create({name: 'Company Name', address_attributes: {name: 'bla',address1: 'some street'}})
      expect(company2.address.name).to eq 'bla'
    end

  end


  describe "components" do
    before{company.components << create(:component, name: 'Widget 1')}
    it {should respond_to(:components)}
    it 'should add a component' do
      expect(company.components[1].name).to eq 'Widget 1'
    end
    it 'should persist the component' do
      expect(company.components[1].persisted?).to be_truthy
    end
  end
end
