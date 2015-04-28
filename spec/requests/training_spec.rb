require 'rails_helper'

RSpec.describe "Training", :type => :request do
  it "get the training index" do
    get training_path
    expect(response).to have_http_status(200)
  end

end