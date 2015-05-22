require "rails_helper"

RSpec.describe Api::V1::LogEntriesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/v1/log_entries").to route_to("api/v1/log_entries#index")
    end

    it "routes to #new" do
      expect(:get => "/api/v1/log_entries/new").to route_to("api/v1/log_entries#new")
    end

    it "routes to #show" do
      expect(:get => "/api/v1/log_entries/1").to route_to("api/v1/log_entries#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/api/v1/log_entries/1/edit").to route_to("api/v1/log_entries#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/api/v1/log_entries").to route_to("api/v1/log_entries#create")
    end

    it "routes to #update" do
      expect(:put => "/api/v1/log_entries/1").to route_to("api/v1/log_entries#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/v1/log_entries/1").to route_to("api/v1/log_entries#destroy", :id => "1")
    end

  end
end
