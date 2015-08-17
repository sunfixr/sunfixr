require 'rails_helper'

RSpec.describe Project::ProjectPicsController, :type => :controller do
  let(:project){ create :project }
  let(:user){ create :user}
  let(:user_project){ create :users_project, project_id: project.id, user_id: user.id, role: 'admin'}
  let(:project_pic){ create :project_pic, project_id: project.id}

  def login_sunfixr
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user.users_projects << user_project
    user.confirm # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
    sign_in user
  end

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

    it "should redirect user if not a sunfixr" do
      allow(Project).to receive(:find_by_slug).with('ditunga').and_return(project)
      get :index, project_id: 'ditunga'
      expect(response).to redirect_to(project_path(project.id))
    end

    it "should send a 404 error if project not found" do
      allow(Project).to receive(:find_by_slug).with('bogus').and_return(nil)
      get :index, project_id: 'bogus'
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'destroy' do
    before(:each) do
      login_sunfixr
      project.project_pics << project_pic
      allow(ProjectPic).to receive(:find).with(project_pic.id.to_s).and_return(project_pic)
      delete :destroy, project_id: project.id, id: project_pic.id
    end

    it 'should delete the user_project record' do
      expect(project.project_pics.count).to eq 0
    end

    it 'should redirect the user back to the project_users page' do
      expect(response).to redirect_to(project_project_pics_path(project.id))
    end

    it "should set the flash notice" do
      expect(flash[:notice]).to eq "Picture deleted"
    end
  end


end
