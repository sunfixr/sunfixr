require "rails_helper"

RSpec.describe ProjectController, :type => :routing do
  describe "routing" do
    it "routes 'projects to index" do
      expect(:get => "/projects").to route_to("project#index")
    end
    it "routes to a single project"  do
      expect(:get => "/project/ditunga").to route_to(controller: 'project', action: 'home', name: 'ditunga')
    end

  end



end