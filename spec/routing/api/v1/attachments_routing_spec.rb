require "rails_helper"

RSpec.describe Api::V1::AttachmentsController, :type => :routing do

  describe "routing" do

    it "routes to #show" do
      expect(:get => "/api/v1/attachments/1").to route_to("api/v1/attachments#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/api/v1/attachments").to route_to("api/v1/attachments#create")
    end

    it "routes to #update" do
      expect(:put => "/api/v1/attachments/1").to route_to("api/v1/attachments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/v1/attachments/1").to route_to("api/v1/attachments#destroy", :id => "1")
    end

  end
end