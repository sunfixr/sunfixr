require 'rails_helper'
RSpec.describe ManualsController, :type => :routing do
  it "should route to the manuals index page" do
    expect(get manuals_path).to route_to('manuals#index')
  end
end