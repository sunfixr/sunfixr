require "rails_helper"

RSpec.describe Api::V1::ComponentsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/v1/components").to route_to("api/v1/components#index")
    end

    it "routes to #new" do
      expect(:get => "/api/v1/components/new").to route_to("api/v1/components#new")
    end

    it "routes to #show" do
      expect(:get => "/api/v1/components/1").to route_to("api/v1/components#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/api/v1/components/1/edit").to route_to("api/v1/components#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/api/v1/components").to route_to("api/v1/components#create")
    end

    it "routes to #update" do
      expect(:put => "/api/v1/components/1").to route_to("api/v1/components#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/v1/components/1").to route_to("api/v1/components#destroy", :id => "1")
    end

  end
end
