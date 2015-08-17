require 'rails_helper'

RSpec.describe Project::AttachmentsController, type: :controller do

  let(:project){ create :project }
  let(:user){ create :user}
 # let(:user_project){ create :users_project, project_id: project.id, user_id: user.id, role: 'admin'}
  let(:project_attachment){ create :attachment, project_id: project.id}

  describe 'Index' do
    it "should find and assign the project when given an ID" do
      allow(Project).to receive(:find_by_id).with('1').and_return(project)
      get :index, project_id: '1'
      expect(assigns(:project)).to be project
    end
    it "should find and assign the project when given a slug" do
      allow(Project).to receive(:find_by_slug).with('ditunga').and_return(project)
      get :index, project_id: 'ditunga'
      expect(assigns(:project)).to be project
    end
  end

  describe 'List' do
    it "should find and assign the project when given an ID" do
      allow(Project).to receive(:find_by_id).with('1').and_return(project)
      get :list, project_id: '1'
      expect(assigns(:project)).to be project
    end
    it "should find and assign the project when given a slug" do
      allow(Project).to receive(:find_by_slug).with('ditunga').and_return(project)
      get :list, project_id: 'ditunga'
      expect(assigns(:project)).to be project
    end

    it "should send a 404 if project not found with id" do
      allow(Project).to receive(:find_by_id).with('1').and_return(nil)
      get :list, project_id: '1'
      expect(response).to have_http_status(:not_found)
    end

    it "should send a 404 if project not found with slug" do
      allow(Project).to receive(:find_by_slug).with('bogus').and_return(nil)
      get :list, project_id: 'bogus'
      expect(response).to have_http_status(:not_found)
    end
  end

end
