require 'rails_helper'

RSpec.describe "Project", :type => :request do
  it "get the project index" do
    get projects_path
    expect(response).to have_http_status(200)
  end

  it "should get an individual project" do
    get project_home_path(name: 'ditunga')
    expect(response).to have_http_status(200)
  end

  it "redirects the 'project' root path to 'projects'" do
    get '/project'
    expect(response).to redirect_to(projects_path)
  end
end