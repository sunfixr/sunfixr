require 'rails_helper'
RSpec.describe ProjectController, :type => :controller do
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
    describe "project_pics" do
      let(:project){ create :project_with_project_pics }
      let(:params){ project.attributes.merge({'project_pics_attributes' => project.project_pics.collect{|pic|pic.attributes}}) }
      before :each do
        allow(Project).to receive(:find).and_return(project)
      end
      it "should update the project pictures notes in bulk" do
        params['project_pics_attributes'][0]['notes'] = 'Hello'
        params['project_pics_attributes'][1]['notes'] = 'Hello Too'
        put :update, {:id => project.to_param.to_i, project: params}
        expect(assigns(:project).project_pics[0].notes).to eq 'Hello'
        expect(assigns(:project).project_pics[1].notes).to eq 'Hello Too'
        expect(assigns(:project).project_pics[1]).to be_persisted
      end

    end

    describe "users" do
      let(:project){ create :project_with_users, :with_company}
      let(:params){ project.attributes.merge({'users_attributes' => project.users.collect{|pic|pic.attributes}}) }
      before :each do
        allow(Project).to receive(:find).and_return(project)
      end

      it "should update the project user roles in bulk" do
        params['users_attributes'][0]['role'] = 'admin'
        put :update, {:id => project.to_param.to_i, project: params}
        expect(assigns(:project).users[0].role).to eq 'admin'
      end
    end

    describe "attachments" do
      let(:project){ create :project_with_attachments }
      let(:params){ project.attributes.merge({'attachments_attributes' => project.attachments.collect{|pic|pic.attributes}}) }
      before :each do
        allow(Project).to receive(:find).and_return(project)
      end
      it "should update the project pictures notes in bulk" do
        params['attachments_attributes'][0]['notes'] = 'Hello'
        params['attachments_attributes'][1]['notes'] = 'Hello Too'
        put :update, {:id => project.to_param.to_i, project: params}
        expect(assigns(:project).attachments[0].notes).to eq 'Hello'
        expect(assigns(:project).attachments[1].notes).to eq 'Hello Too'
        expect(assigns(:project).attachments[1]).to be_persisted
      end

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
