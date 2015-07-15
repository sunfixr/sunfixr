require 'rails_helper'
RSpec.describe Project::AttachmentsController, :type => :routing do
  it "should route to the project_attachments index page" do
    expect(get project_attachments_path(1)).to route_to('project/attachments#index', project_id: '1')
  end
end