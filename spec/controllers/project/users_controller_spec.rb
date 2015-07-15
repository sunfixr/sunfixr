require 'rails_helper'

RSpec.describe Project::UsersController, type: :controller do
  let(:project){ create :project }
  let(:user){ create :user}
  let(:user_project){ create :users_project, project_id: project.id, user_id: user.id, role: 'admin'}

  def login_sunfixr
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user.users_projects << user_project
    user.confirm # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
    sign_in user
  end

  describe 'Index' do
    it "should find and assign the project when given an ID" do
      expect(Project).to receive(:find).with('1').and_return(project)
      get :index, project_id: '1'
      expect(assigns(:project)).to be project
    end
    it "should find and assign the project when given a slug" do
      expect(Project).to receive(:find_by_slug).with('ditunga').and_return(project)
      get :index, project_id: 'ditunga'
      expect(assigns(:project)).to be project
    end
    it "should redirect user if not a sunfixr" do
      allow(Project).to receive(:find_by_slug).with('ditunga').and_return(project)
      get :index, project_id: 'ditunga'
      expect(response).to redirect_to(project_path(project.id))
    end
  end


  describe 'destroy' do
    before(:each) do
      login_sunfixr
      allow(UsersProject).to receive(:find).with(user_project.id.to_s).and_return(user_project)
      delete :destroy, project_id: project.id, id: user_project.id
    end

    it 'should delete the user_project record' do
      expect(project.users.count).to eq 0
    end

    it 'should redirect the user back to the project_users page' do
      expect(response).to redirect_to(project_users_path(project.id))
    end

    it "should set the flash notice" do
      expect(flash[:notice]).to eq "User removed from site"
    end
  end

  describe "invite" do
    before(:each) do
      login_sunfixr
    end
    it "should invite a sunfixer by email" do
      expect{
        post :invite, emails: 'fake@fake.com', invitation: 'HELLO', project_id: project.id
      }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end

    describe 'response' do
      before(:each) do
        post :invite, emails: 'fake@fake.com', invitation: 'HELLO', project_id: project.id
      end

      it "should redirect back to project_users" do
        expect(response).to redirect_to(project_users_path(project.id))
      end
      it "should set the flash message" do
        expect(flash[:notice]).to eq "Email has been sent to  fake@fake.com"
      end

    end
  end

end

