require 'rails_helper'

RSpec.describe "Manuals", :type => :request do
  it "get the manuals index" do
    get manuals_path
    expect(response).to have_http_status(200)
  end

end