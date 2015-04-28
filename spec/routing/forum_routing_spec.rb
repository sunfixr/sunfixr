require 'rails_helper'
RSpec.describe ForumController, :type => :routing do
  it "should route to the fourm index page" do
    expect(get forum_path).to route_to 'forum#index'
  end
end