
require 'rails_helper'

RSpec.describe HomeController, :type => :routing do

  it "root routes to #index" do
    expect(:get => "/home").to route_to("home#index")
  end
  it "root routes to #index" do
    expect(:get => "/").to route_to("home#index")
  end

  it "creates a root path" do
    expect(root_path).to eq "/"
  end

end