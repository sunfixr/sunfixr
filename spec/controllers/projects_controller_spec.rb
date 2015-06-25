require 'rails_helper'
RSpec.describe ProjectsController, :type => :controller do
  let(:project){ create :project }
  let(:user){ create :user}
  let(:user_project){ create :users_project, project_id: project.id, user_id: user.id, role: 'admin'}
  let(:project_pic){ create :project_pic, project_id: project.id}

  describe "index" do

    it "should assign 'projects' " do
      expect(Project).to receive(:all).and_return([project])
      get :index
    end
    it "should render the index view" do
      allow(Project).to receive(:all).and_return([project])
      get :index
      expect(response).to render_template(:index)
    end

  end

  describe "update" do
    it "should update the project pictures in bulk" do
      pending "this is best tested in the manage_project_pics feature spec"
      assert false
    end
    it "should update the project user roles in bulk" do
      pending "this is best tested in the manage_users feature spec"
      assert false
    end
  end

  describe "show" do
    it "should find the project" do
      expect(Project).to receive(:find).with(project.id.to_s).and_return(project)
      get :show, id: project.id
    end
    describe "response" do
      before :each do
        allow(Project).to receive(:find).with(project.id.to_s).and_return(project)
        get :show, id: project.id
      end
      it "should assign 'project' " do
        expect(assigns(:project)).to be project
      end
      it "should render the show view" do
        expect(response).to render_template(:show)
      end
    end
  end
end
