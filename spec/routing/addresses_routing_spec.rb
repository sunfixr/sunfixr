require "rails_helper"

RSpec.describe Api::V1::AddressesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/v1/addresses").to route_to("api/v1/addresses#index")
    end

    it "routes to #new" do
      expect(:get => "/api/v1/addresses/new").to route_to("api/v1/addresses#new")
    end

    it "routes to #show" do
      expect(:get => "/api/v1/addresses/1").to route_to("api/v1/addresses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/api/v1/addresses/1/edit").to route_to("api/v1/addresses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/api/v1/addresses").to route_to("api/v1/addresses#create")
    end

    it "routes to #update" do
      expect(:put => "/api/v1/addresses/1").to route_to("api/v1/addresses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/v1/addresses/1").to route_to("api/v1/addresses#destroy", :id => "1")
    end

  end
end
