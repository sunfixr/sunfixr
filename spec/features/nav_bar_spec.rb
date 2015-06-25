require 'rails_helper'
feature "Top Navigation Bar", :type => :feature do

  let(:project){ create(:project_with_company, id: 1, project_pics: create_pair(:project_pic, notes: 'Notes'))}
  let(:user){create(:user)}

  before :each do
    allow(Project).to receive(:find_by_slug).with('foo').and_return(project)
  end

  describe "un-logged on user" do
    before :each do
      visit '/projects/foo'
      @navbar = find('#navbar')
    end

    it "should not have a link to the admin page" do
      expect(@navbar).not_to have_link('Admin')
    end


    it 'should have a link to projects page' do
      expect(@navbar.find_link('Projects')[:href]).to eq '/projects'
    end

    it "should have the 'Sign Up' link in nav bar with project_id param" do
      expect(@navbar.find_link('Sign Up')[:href]).to eq '/user/sign_up?project_id=' + project.id.to_s
    end

    it "should have the 'Sign In' link in nav bar" do
      expect(@navbar).to have_link('Sign In')
    end

    it "should not have the 'Sign Out' link in nav bar" do
      expect(@navbar).not_to have_link('Sign Out')
    end
  end

  describe "sunfixr" do
    let(:users_project) { create(:users_project, user_id: user.id, project_id: project.id, role: 'sunifixr') }
    before :each do
      user.users_projects << users_project
      user.reload
      project.reload
      allow(user).to receive(:sunfixr?).and_return(true)
      login_as(user, :scope => :user)
      visit '/projects/foo'
      @navbar = find('#navbar')
    end
    it "should not have a link to the admin page" do
      expect(@navbar).not_to have_link('Admin')
    end
    it "should not have the Join link" do
      expect(@navbar).not_to have_link('Join')
    end
    it "should not have the Sign Up link" do
      expect(@navbar).not_to have_link('Sign Up')
    end
    it "should not have the 'Sign In' link in nav bar" do
      expect(@navbar).not_to have_link('Sign In')
    end
    it "should have the 'Sign Out' link in nav bar" do
      expect(@navbar).to have_link('Sign Out')
    end
  end

  describe "project admin" do
    let(:users_project) { create(:users_project, user_id: user.id, project_id: project.id, role: 'admin') }
    before :each do
      user.users_projects << users_project
      user.reload
      project.reload
      allow(user).to receive(:project_admin?).and_return(true)
      login_as(user, :scope => :user)
      visit '/projects/foo'
      @navbar = find('#navbar')
    end
    it "should not have a link to the admin page" do
      expect(@navbar).not_to have_link('Admin')
    end
    it "should not have the Join link" do
      expect(@navbar).not_to have_link('Join')
    end
    it "should not have the Sign Up link" do
      expect(@navbar).not_to have_link('Sign Up')
    end
    it "should not have the 'Sign In' link in nav bar" do
      expect(@navbar).not_to have_link('Sign In')
    end
    it "should have the 'Sign Out' link in nav bar" do
      expect(@navbar).to have_link('Sign Out')
    end
  end

  describe "root admin" do
    let(:user){create(:user, role: 'admin')}
    before :each do
      allow(user).to receive(:admin?).and_return(true)
      login_as(user, :scope => :user)
      visit '/projects/foo'
      @navbar = find('#navbar')
    end
    it "should have a link to the admin page" do
      expect(@navbar).to have_link('Admin')
    end
    it "should have the Join link" do
      expect(page).to have_link('Join')
    end
    it "should not have the Sign Up link" do
      expect(@navbar).not_to have_link('Sign Up')
    end
    it "should not have the 'Sign In' link in nav bar" do
      expect(@navbar).not_to have_link('Sign In')
    end
    it "should have the 'Sign Out' link in nav bar" do
      expect(@navbar).to have_link('Sign Out')
    end
  end

  describe "logged in but not a member" do
    before :each do
      login_as(user, :scope => :user)
      visit '/projects/foo'
      @navbar = find('#navbar')
    end

    it "should have the Join link" do
      expect(@navbar).to have_link('Join')
    end
    it "should not have the Sign Up link" do
      expect(@navbar).not_to have_link('Sign Up')
    end
    it "should not have the 'Sign In' link in nav bar" do
      expect(@navbar).not_to have_link('Sign In')
    end
    it "should have the 'Sign Out' link in nav bar" do
      expect(@navbar).to have_link('Sign Out')
    end
  end

  describe "un-logged on user on the projects index page" do
    before :each do
      visit '/projects'
      @navbar = find('#navbar')
    end
    it "should not have a link to the admin page" do
      expect(@navbar).not_to have_link('Admin')
    end

    it 'should have a link to projects page' do
      expect(@navbar.find_link('Projects')[:href]).to eq '/projects'
    end

    it "should not have the 'Sign Up' link in nav bar" do
      expect(@navbar).not_to have_link('Sign Up')
    end

    it "should not have the 'Join' link in nav bar" do
      expect(@navbar).not_to have_link('Join')
    end
    it "should have the 'Sign In' link in nav bar" do
      expect(@navbar).to have_link('Sign In')
    end
    it "should not have the 'Sign Out' link in nav bar" do
      expect(@navbar).not_to have_link('Sign Out')
    end

  end
end