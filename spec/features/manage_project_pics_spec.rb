require 'rails_helper'
feature "Project Picture management", :type => :feature do
  let(:project){ create(:project_with_company, id: 1, project_pics: create_pair(:project_pic, notes: 'Notes'))}
  let(:user){create(:user)}
  let(:users_project) { create(:users_project, user_id: user.id, project_id: project.id, role: 'sunifixr') }

  before :each do
    allow(Project).to receive(:find).and_return(project)
  end
  after :each do
    Warden.test_reset!
   # delete_pictures
  end

  describe "an unauthorized user" do
    it "should restrict access tp project pictures" do
      visit '/project/1/project_pics'
      expect(find('div.alert-danger')).to have_text('You are not authorized to manage project pictures.')
    end
  end

  describe "an authorized user" do
    before :each do
      user.users_projects << users_project
      allow(user).to receive(:sunfixr?).and_return(true)
      login_as(user, :scope => :user)
      visit '/project/1/project_pics'
    end

    it "should  display the 'remove' link for each project_pic" do
      expect(all('a.destroy_link').length).to be 2
    end
    it "should display textarea for each project_pic" do
      expect(all('textarea').length).to eq 2
    end
    it "should display the contents of the notes" do
      all('textarea').each{|ta|expect(ta.text).to eq 'Notes' }
    end

    it "should display an image tag for each project_pic" do
      expect(all('img[alt="Thumb sunfixrs"]').length).to eq 2
    end
  end

  def login_user
    visit '/user/sign_in'
    user.users_projects << users_project
    allow_any_instance_of(User).to receive(:sunfixr?).and_return(true)
    fill_in('user_email',{with: user.email})
    fill_in('user_password',{with: user.password})
    click_button('Log in')
  end

  describe "update notes" do
    let(:users_project) { create(:users_project, user_id: user.id, project_id: project.id, role: 'sunifixr') }
    before :each do
      login_user
      visit '/project/1/project_pics'
    end
    it "should change the contents of the project_pic Notes" do
      fill_in('project_project_pics_attributes_0_notes',{with: 'New Text'})
      click_button('Update Project')
      expect(find('#project_project_pics_attributes_0_notes').text).to eq 'New Text'
    end
  end

  describe "new project pic", :js => true do
    before :each do
      login_user
      visit '/project/1/project_pics'
      click_link("Add a Project Pic")
    end
    it "should add a new field for upload" do
      expect(find('#add_project_project_pics_attributes_2_picture')).not_to be_nil
    end
    it "should upload a new picture" do
      pending "this is working in all browsers but caybasr webkit does not like it do to overlapping span."
      fill_in('add_project_project_pics_attributes_2_notes', with: 'HELLO')
      attach_file "add_project_project_pics_attributes_2_picture", "#{::Rails.root}/spec/support/sunfixrs.jpg", :visible => false
      click_button('Update Project')
      id = find("#edit_project_1").find(:xpath,"//input[@id='project_project_pics_attributes_2_id']", :visible => false).value
      expect(File.exists?("#{::Rails.root}/public/uploads/test/picture/#{id}/sunfixrs.jpg")).to be_truthy
    end
  end

end