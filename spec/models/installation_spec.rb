require 'rails_helper'

RSpec.describe Installation, :type => :model do
  subject(:installation) {FactoryGirl.create(:installation, :with_company, :with_components, :with_address, name:'Foo 1', slug: 'foo')}
  it {should respond_to(:name)}
  it {should be_valid}

  describe "when name is not present" do
    before { installation.name = " " }
    it {should_not be_valid}
  end

  describe "when slug is not present" do
    before {installation.slug = ' '}
    it "should be valid" do
      expect(installation).to be_valid
    end
    it "should use the name field to make the slug" do
      installation.validate
      expect(installation.slug).to eq "foo-1"
    end
  end

  describe 'when slug is taken' do
    before{installation}
    it "should not be valid when slug is taken" do
      expect(FactoryGirl.build(:installation, name: 'Foo 2', slug: 'foo')).not_to be_valid
    end
  end


  describe 'address' do
    before{installation.address = FactoryGirl.build(:address, name: 'bogus name', address1: '2323 Bogus ln') }
    it{should respond_to(:address)}
    it "should have an address1" do
      expect(installation.address.address1).to eq "2323 Bogus ln"
    end
    it "save the address" do
      expect(Address.find(installation.address.id).address1).to eq '2323 Bogus ln'
    end
    it "should save the address relationship to the installation" do
      installation2 = Installation.find(installation.id)
      expect(installation2.address).to eq installation.address
    end
    it "should populate the address.name with the installation name if blank" do
      installation2 = Installation.create({name: 'mysite', slug: 'somesite', address_attributes: {name: '',address1: 'some street'}})
      expect(installation2.address.name).to eq 'mysite'
    end

    it "should not change the address.name if set" do
      installation2 = Installation.create({name: 'mysite', slug: 'somesite', address_attributes: {name: 'bla',address1: 'some street'}})
      expect(installation2.address.name).to eq 'bla'
    end

  end

  describe 'company' do
    it{should respond_to :company}
    it "should have a company name" do
      expect(installation.company.name).to eq 'Universal Studios'
    end
    it "should save the a new company" do
      expect{installation.company = create(:company, name: 'Some Company')}.not_to raise_error
    end
  end

  describe 'when adding a component' do
    before{installation.components << build(:component, name: 'Special Inverter', component_type: create(:component_type, name: 'Inverter'))}
    it{should respond_to :components}
    it "should have a non zero count" do
      expect(installation.components.count).to eq 3
    end
    it "should save the new component" do
      expect(Component.find(installation.components[2].id)).to eq installation.components[2]
    end
  end

  describe 'when adding a log_entry' do
    before{installation.log_entries << build(:log_entry, user: 'Joe', comments: 'Checked charge on batteries.')}
    it{should respond_to :log_entries}
    it "should have a count of 2" do
      expect(installation.log_entries.count).to eq 1
    end
    it "should save the new log_entry" do
      expect(LogEntry.find(installation.log_entries[0].id)).to eq installation.log_entries[0]
    end
  end

  describe "When install_date" do
    it "is blank" do
      installation.install_date = nil
      expect(installation).to_not be_valid
    end
  end

  describe "When description" do
    it "is blank" do
      installation.description = ''
      expect(installation).to_not be_valid
    end

  end

  describe "When component_ids" do
    let(:test_component) { create(:component) }

    describe "are empty" do
      it "should not raise and exception" do
        expect { installation.component_ids = [] }.not_to raise_error
      end

      it "should not change the count" do
        expect { installation.component_ids = [] }.to change(installation.components, :size).by(0)
      end
    end

    describe "is a valid existing component" do

      it "should change the component count by one." do
        expect { installation.component_ids = [test_component.id] }.to change(installation.components, :size).by(1)
      end
      it "should change the component count by one. if given an valid integer id" do
        expect { installation.component_ids = test_component.id }.to change(installation.components, :size).by(1)
      end
      it "should not add if existing" do
        expect { installation.component_ids = [1000] }.to change(installation.components, :size).by(0)
      end

    end

    describe "is an array of valid component ids" do
      let(:test_components) { [create(:component).id,create(:component).id] }

      it "should change the count by the array size if all are not linked yet" do
        expect { installation.component_ids = test_components }.to change(installation.components, :size).by(2)
      end

      it "should change the count by only the number of ids not already linked" do
        test_components << installation.components[0].id
        expect { installation.component_ids = test_components }.to change(installation.components, :size).by(2)
      end
    end

  end
end
