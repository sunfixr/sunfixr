require 'rails_helper'

RSpec.describe "Forum", :type => :request do
  it "get the forum index" do
    get forum_path
    expect(response).to have_http_status(200)
  end

end