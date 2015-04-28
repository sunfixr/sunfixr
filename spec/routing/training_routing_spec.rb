
require 'rails_helper'
RSpec.describe TrainingController, :type => :routing do
  it "should route to the training index page" do
    expect(get training_path).to route_to('training#index')
  end
end