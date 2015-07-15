require 'rails_helper'
describe 'The project home page' do
  let(:project){ create(:project_with_company, id: 1, project_pics: create_pair(:project_pic, notes: 'Notes'))}
  let(:user){create(:user)}

  before :each do
    allow(Project).to receive(:find_by_slug).with('foo').and_return(project)
  end

  describe "un-logged on user" do
    before :each do
      visit '/project/foo'
    end

    it 'should display the project information' do
      expect(page).to have_content 'Foo 1'
    end
    it "should not show the delete button" do
      expect(page).not_to have_content('Delete This Project')
    end
    it "should not show the manage users button" do
      expect(page).not_to have_content('Manage Users')
    end
    it "should not show the edit pictures button" do
      expect(page).not_to have_content('Edit Pictures')
    end

    it 'should show the maintenance log button' do
      expect(page).to have_link('See full maintenance log.')
    end

    it 'should show the Project Files link' do
      expect(page).to have_css('#attachments-link[href="/project/' + project.slug + '/attachments/list"]')
    end

    it 'should not show the edit Files link' do
      expect(page).not_to have_css('#edit-attachments-link[href="/project/' + project.slug + '/attachments"]')
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
      visit '/project/foo'
    end
    it "should not show the delete button" do
      expect(page).not_to have_content('Delete This Project')
    end
    it "should not show the manage users button" do
      expect(page).not_to have_content('Manage Users')
    end
    it "should show the edit pictures button" do
      expect(page).to have_content('Edit Pictures')
    end
    it 'should show the maintenance log button' do
      expect(page).to have_link('See full maintenance log.')
    end

    it 'should show the Project Files link' do
      expect(page).to have_css('#attachments-link[href="/project/' + project.slug + '/attachments/list"]')
    end

    it 'should not show the edit Files link' do
      expect(page).not_to have_css('#edit-attachments-link[href="/project/' + project.slug + '/attachments"]')
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
      visit '/project/foo'
    end
    it "should not show the delete button" do
      expect(page).not_to have_content('Delete This Project')
    end
    it "should show the manage users button" do
      expect(page).to have_content('Manage Users')
    end
    it "should show the edit pictures button" do
      expect(page).to have_content('Edit Pictures')
    end
    it 'should show the maintenance log button' do
      expect(page).to have_link('See full maintenance log.')
    end

    it 'should not show the Project Files link' do
      expect(page).not_to have_css('#attachments-link[href="/project/' + project.slug + '/attachments/list"]')
    end

    it 'should show the edit Project Files link' do
      expect(page).to have_css('#edit-attachments-link[href="/project/' + project.slug + '/attachments"]')
    end

  end

  describe "root admin" do
    let(:user){create(:user, role: 'admin')}
    before :each do
      allow(user).to receive(:admin?).and_return(true)
      login_as(user, :scope => :user)
      visit '/project/foo'
    end
    it "should show the delete button" do
      expect(page).to have_content('Delete This Project')
    end
    it "should show the manage users button" do
      expect(page).to have_content('Manage Users')
    end
    it "should show the edit pictures button" do
      expect(page).to have_content('Edit Pictures')
    end

    it "should delete the project when link is clicked" do
      expect{click_link('Delete This Project')}.to change{Project.all.count}.by(-1)
    end

    it "should delete the project and return to projects page when link is clicked" do
      click_link('Delete This Project')
      expect(page).to have_content 'Current Projects'
    end

    it 'should show the maintenance log button' do
      expect(page).to have_link('See full maintenance log.')
    end

    it 'should not show the Project Files link' do
      expect(page).not_to have_css('#attachments-link[href="/project/' + project.slug + '/attachments/list"]')
    end

    it 'should show the edit Project Files link' do
      expect(page).to have_css('#edit-attachments-link[href="/project/' + project.slug + '/attachments"]')
    end
  end

  describe "not a member" do
    before :each do
      login_as(user, :scope => :user)
      visit '/project/foo'
    end
    it "should not show the delete button" do
      expect(page).not_to have_content('Delete This Project')
    end
    it "should not show the manage users button" do
      expect(page).not_to have_content('Manage Users')
    end
    it "should not show the edit pictures button" do
      expect(page).not_to have_content('Edit Pictures')
    end
  end


end