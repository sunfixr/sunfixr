require 'rails_helper'

RSpec.describe AngularController, :type => :routing do
  it "root routes to #index" do
    expect(:get => "/angular").to route_to("angular#index")
  end


end