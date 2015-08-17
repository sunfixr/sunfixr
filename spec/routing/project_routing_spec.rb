require 'rails_helper'
RSpec.describe ProjectController, :type => :routing do
  it "should route to the projects index page" do
    expect(get projects_path).to route_to('project#index')
  end

  it "should route to the project home page" do
    expect(get project_path(1)).to route_to('project#show', id: '1')
  end

end

describe Project::ProjectPicsController, :type => :routing do
  it "should route to the project pics page" do
    expect(get project_project_pics_path(1)).to route_to('project/project_pics#index', project_id: '1')
  end
  it "should route to the project profile pic page" do
    expect(get project_project_pic_path(1,1)).to route_to('project/project_pics#show', project_id: '1', id: '1')
  end

  it "should route to the delete project profile pic page" do
    expect(delete project_project_pic_path(1,1)).to route_to('project/project_pics#destroy', project_id: '1', id: '1')
  end
end

describe Project::AttachmentsController, :type => :routing do
  it "should route to the Project Attachments page" do
    expect(get project_attachments_path(1)).to route_to('project/attachments#index', project_id: '1')
  end

  it "should route to the project attachments list page" do
    expect(get project_attachments_list_path(1)).to route_to('project/attachments#list', project_id: '1')
  end
end