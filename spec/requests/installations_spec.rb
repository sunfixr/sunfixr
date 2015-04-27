require 'rails_helper'

RSpec.describe "Installations", :type => :request do
  describe "GET /installations" do
    it "works! (now write some real specs)" do
      get installations_path
      expect(response).to have_http_status(200)
    end
  end
end
