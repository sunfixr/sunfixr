require 'rails_helper'

RSpec.describe MonController, :type => :controller do
  it "should display 'OK'" do
    get :index
    expect(response).to render_template(:index)
  end
end
