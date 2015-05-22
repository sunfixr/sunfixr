require "rails_helper"

RSpec.describe Api::V1::CompaniesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/v1/companies").to route_to("api/v1/companies#index")
    end

    it "routes to #new" do
      expect(:get => "/api/v1/companies/new").to route_to("api/v1/companies#new")
    end

    it "routes to #show" do
      expect(:get => "/api/v1/companies/1").to route_to("api/v1/companies#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/api/v1/companies/1/edit").to route_to("api/v1/companies#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/api/v1/companies").to route_to("api/v1/companies#create")
    end

    it "routes to #update" do
      expect(:put => "/api/v1/companies/1").to route_to("api/v1/companies#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/v1/companies/1").to route_to("api/v1/companies#destroy", :id => "1")
    end

  end
end
