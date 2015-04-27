require "rails_helper"

RSpec.describe InstallationsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/installations").to route_to("installations#index")
    end

    it "routes to #new" do
      expect(:get => "/installations/new").to route_to("installations#new")
    end

    it "routes to #show" do
      expect(:get => "/installations/1").to route_to("installations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/installations/1/edit").to route_to("installations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/installations").to route_to("installations#create")
    end

    it "routes to #update" do
      expect(:put => "/installations/1").to route_to("installations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/installations/1").to route_to("installations#destroy", :id => "1")
    end

  end
end
