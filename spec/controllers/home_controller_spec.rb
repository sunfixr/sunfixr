require 'rails_helper'

RSpec.describe HomeController, :type => :controller do
  it "should render the home index template" do
    get :index
    expect(response).to render_template(:index)
  end
end
